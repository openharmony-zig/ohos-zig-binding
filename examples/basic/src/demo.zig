const hilog = @import("hilog");
const ability_access_control = @import("ability_access_control");

export fn runBindingDemo() bool {
    hilog.info("ohos-zig-binding demo started");

    const granted = ability_access_control.checkSelfPermission("ohos.permission.INTERNET");
    if (granted) {
        hilog.info("INTERNET permission is granted");
    } else {
        hilog.info("INTERNET permission is not granted");
    }

    return granted;
}
