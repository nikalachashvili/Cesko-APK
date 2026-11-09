// TEMPORARY: renders screenshots for visual layout check. Delete after use.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voters/core/theme/app_theme.dart';
import 'package:voters/features/voter_search/data/mock_search_result.dart';
import 'package:voters/features/voter_search/voter_result_screen.dart';

const _out =
    '/private/tmp/claude-501/-Users-nikalachashvili-Desktop-WebProjects-Voters-App-voters/d06a09cd-c650-4376-ba91-222402da0cf7/scratchpad/shots';

Future<void> _loadFont(String family, String path) async {
  final bytes = File(path).readAsBytesSync();
  final loader = FontLoader(family)
    ..addFont(Future.value(ByteData.view(bytes.buffer)));
  await loader.load();
}

void main() {
  setUpAll(() async {
    await _loadFont('Roboto', '/System/Library/Fonts/SFGeorgian.ttf');
    await _loadFont(
      'MaterialIcons',
      '/Users/nikalachashvili/Developer/flutter/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf',
    );
  });

  testWidgets('preview result', (tester) async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (_) async => Directory.systemTemp.createTempSync().path,
        );
    tester.view
      ..physicalSize = const Size(390, 1500) * 3
      ..devicePixelRatio = 3
      ..padding = const FakeViewPadding(top: 47 * 3, bottom: 34 * 3)
      ..viewPadding = const FakeViewPadding(top: 47 * 3, bottom: 34 * 3);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        theme: buildAppTheme(),
        home: VoterResultScreen(result: mockSearchResult),
      ),
    );
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(Uri.file('$_out/result_top.png')),
    );

    final toggle = find.text('ამ მისამართზე რეგისტრირებულ ამომრჩეველთა სია');
    await tester.tap(toggle);
    await tester.pumpAndSettle();
    await tester.drag(find.byType(ListView), const Offset(0, -700));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(Uri.file('$_out/result_expanded.png')),
    );
  });
}
