import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('iOS helper Objective-C classes use file_picker-prefixed names', () {
    final sourceFiles = Directory('ios/file_picker/Sources/file_picker')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.h') || file.path.endsWith('.m'))
        .toList();

    final sources =
        sourceFiles.map((file) => file.readAsStringSync()).join('\n');

    expect(sourceFiles.map((file) => file.path),
        isNot(contains(endsWith('FileUtils.h'))));
    expect(sourceFiles.map((file) => file.path),
        isNot(contains(endsWith('FileUtils.m'))));
    expect(sources, contains('FilePickerUtils'));
    expect(sources,
        isNot(contains(RegExp(r'@(interface|implementation)\s+FileUtils\b'))));
    expect(sources, isNot(contains(RegExp(r'\bFileUtils\b'))));
  });
}
