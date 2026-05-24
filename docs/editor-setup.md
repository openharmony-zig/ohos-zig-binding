# Editor Setup

Set `OHOS_NDK_HOME` to the OpenHarmony native SDK directory:

```sh
export OHOS_NDK_HOME=/path/to/ohos-sdk/native
```

For command-line builds, `OHOS_SDK_HOME=/path/to/ohos-sdk` is also accepted as a fallback. For editor C/C++ indexing, use `OHOS_NDK_HOME`; the checked-in editor settings reference that variable directly.

The repository includes lightweight editor config for both VSCode and Zed:

- `.vscode/settings.json` configures the VSCode C/C++ extension include paths.
- `.zed/settings.json` configures clangd fallback flags for Zed.

Both configs use `OHOS_NDK_HOME` and point C/C++ indexing at:

- `$OHOS_NDK_HOME/sysroot/usr/include`
- `$OHOS_NDK_HOME/sysroot/usr/include/aarch64-linux-ohos`

After changing the environment variable, restart VSCode/Zed so the editor process inherits it.
