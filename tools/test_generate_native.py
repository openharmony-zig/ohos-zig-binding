import pathlib
import tempfile
import unittest

import generate_native as gen


class NativeGenerationTests(unittest.TestCase):
    def test_comments_do_not_hide_native_calls_after_url_strings(self):
        source = '\n'.join([
            'let url = "https://host"; OH_Real(); // OH_Fake()',
            '/* outer /* inner */ OH_Hidden() */ OH_Visible();',
            'let raw = r##"// literal"##; OH_AfterRaw();',
        ])
        cleaned = gen.strip_comments(source)
        for name in ['OH_Real', 'OH_Visible', 'OH_AfterRaw']:
            self.assertIn(name, cleaned)
        for name in ['OH_Fake', 'OH_Hidden']:
            self.assertNotIn(name, cleaned)

    def test_callback_parameters_and_void(self):
        self.assertEqual(gen.parameters('OH_Test(void)', 'OH_Test'), [])
        self.assertEqual(gen.parameters('OH_Test(int n, void (*cb)(int, float), int *out)', 'OH_Test'),
                         ['int n', 'void (*cb)(int, float)', 'int *out'])

    def test_header_mentions_are_not_declarations_and_versions_are_precise(self):
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            (root / 'test.h').write_text('''
/** See OH_NotAFunction() in this example. @since 12 */
typedef struct OH_Object OH_Object;
/** @since 13 */
int OH_Real(int value) __attribute__((__availability__(ohos, introduced=15.0.0)));
/** @since 20 */
int OH_Real(int value);
''')
            metadata = gen.headers(root)
            self.assertEqual(set(metadata), {'OH_Real'})
            self.assertEqual(metadata['OH_Real']['api'], 15)
            self.assertEqual(metadata['OH_Real']['parameters'], ['int value'])

    def test_interface_method_introduction_and_callback_arity(self):
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            (root / 'table.h').write_text('''
/** @since 18 */
typedef struct {
/** baseline method */
void (*start)(void);
/** @since 20 */
int (*callback)(int n, void (*fn)(int, int));
} ArkUI_NativeGestureAPI_2;
''')
            table = gen.interfaces(root, 'ArkUI_NativeGestureAPI_2')['arkui']['ArkUI_NativeGestureAPI_2']
            self.assertEqual(table['api'], 18)
            self.assertEqual(table['methods'], [
                {'name': 'start', 'api': 18, 'arity': 0},
                {'name': 'callback', 'api': 20, 'arity': 2},
            ])

    def test_unknown_interface_tables_fail_the_audit(self):
        with tempfile.TemporaryDirectory() as directory:
            with self.assertRaises(ValueError):
                gen.interfaces(pathlib.Path(directory), 'ArkUI_NativeNodeAPI_1')

    def test_variadic_forwarding_is_never_silently_generated(self):
        with self.assertRaises(ValueError):
            gen.render_native('test', [{'symbol': 'OH_Print', 'variadic': True}])


if __name__ == '__main__':
    unittest.main()
