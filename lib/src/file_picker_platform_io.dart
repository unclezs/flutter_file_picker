import 'dart:io';

import 'package:file_picker/src/file_picker.dart';
import 'package:file_picker/src/file_picker_io.dart';
import 'package:file_picker/src/file_picker_macos.dart';
import 'package:file_picker/src/linux/file_picker_linux.dart';
import 'package:file_picker/src/windows/file_picker_windows_stub.dart'
    if (dart.library.ffi) 'package:file_picker/src/windows/file_picker_windows.dart';

FilePicker createFilePicker() {
  if (Platform.isAndroid ||
      Platform.isIOS ||
      Platform.operatingSystem == 'ohos') {
    return FilePickerIO();
  }
  if (Platform.isLinux) {
    return FilePickerLinux();
  }
  if (Platform.isWindows) {
    return FilePickerWindows();
  }
  if (Platform.isMacOS) {
    return FilePickerMacOS();
  }
  throw UnimplementedError(
    'The current platform "${Platform.operatingSystem}" is not supported by this plugin.',
  );
}
