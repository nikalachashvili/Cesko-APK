import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voters/features/voter_search/data/mock_search_result.dart';
import 'package:voters/features/voter_search/voter_result_screen.dart';

import '../../helpers/mock_path_provider.dart';

Future<void> _pumpResult(WidgetTester tester) async {
  tester.view
    ..physicalSize = const Size(1170, 2532)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    MaterialApp(home: VoterResultScreen(result: mockSearchResult)),
  );
  await tester.pumpAndSettle();
}

void main() {
  setUp(mockPathProvider);

  testWidgets('shows the voter details', (tester) async {
    await _pumpResult(tester);

    expect(find.text('ნიკა ლაჩაშვილი'), findsOneWidget);
    expect(find.text('01/01/1970'), findsOneWidget);
    expect(find.text('06/06'), findsOneWidget);
    expect(find.text('266'), findsOneWidget);
    expect(find.text('ელექტრონული'), findsOneWidget);
  });

  testWidgets('toggle shows and hides voters registered at the address', (
    tester,
  ) async {
    await _pumpResult(tester);

    final toggle = find.text('ამ მისამართზე რეგისტრირებულ ამომრჩეველთა სია');
    await tester.scrollUntilVisible(toggle, 300);
    await tester.ensureVisible(toggle);
    await tester.pumpAndSettle();
    await tester.tap(toggle);
    await tester.pumpAndSettle();

    expect(find.text('ნიკა ლაჩაშვილი', skipOffstage: false), findsNWidgets(2));

    await tester.ensureVisible(toggle);
    await tester.pumpAndSettle();
    await tester.tap(toggle);
    await tester.pumpAndSettle();

    expect(find.text('ნიკა ლაჩაშვილი', skipOffstage: false), findsOneWidget);
  });
}
