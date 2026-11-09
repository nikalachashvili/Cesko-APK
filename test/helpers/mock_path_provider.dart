import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// flutter_map caches tiles in a directory from path_provider, which has no
/// platform implementation in widget tests. Points it at a temp directory.
void mockPathProvider() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final dir = Directory.systemTemp.createTempSync('voters_test_');
  addTearDown(() => dir.deleteSync(recursive: true));

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/path_provider'),
        (_) async => dir.path,
      );
}
