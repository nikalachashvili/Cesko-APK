import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:voters/app/app.dart';

import 'helpers/mock_path_provider.dart';

/// Pumps the app on a phone-sized (390×844) viewport.
Future<void> pumpApp(WidgetTester tester) async {
  tester.view
    ..physicalSize = const Size(1170, 2532)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(const VotersApp());
  await tester.pumpAndSettle();
}

void main() {
  setUp(mockPathProvider);

  testWidgets('home tab is shown first', (tester) async {
    await pumpApp(tester);

    expect(
      find.text('საქართველოს საარჩევნო ადმინისტრაციის სისტემა'),
      findsOneWidget,
    );
    expect(find.text('ამომრჩევლის ძიება'), findsOneWidget);
  });

  testWidgets('game tab opens from the bottom bar', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.bySemanticsLabel('თამაში'));
    await tester.pumpAndSettle();

    expect(find.text('თამაშის დაწყება'), findsOneWidget);
  });

  testWidgets('schedule lists events from the selected day onward', (
    tester,
  ) async {
    await pumpApp(tester);

    await tester.tap(find.bySemanticsLabel('ღონისძიებათა გრაფიკი'));
    await tester.pumpAndSettle();

    expect(find.text('ივლისი 2024'), findsOneWidget);
    expect(find.text('ორშაბათი, 8 ივლისი'), findsOneWidget);
    expect(find.text('საათი 15:00'), findsOneWidget);

    // Selecting a day after the only event leaves nothing to show.
    await tester.tap(find.text('9'));
    await tester.pumpAndSettle();

    expect(find.text('ორშაბათი, 8 ივლისი'), findsNothing);
    expect(find.text('ღონისძიებები არ არის'), findsOneWidget);
  });

  testWidgets('voter search card opens the search form and back returns', (
    tester,
  ) async {
    await pumpApp(tester);

    await tester.tap(find.text('ამომრჩევლის ძიება'));
    await tester.pumpAndSettle();

    expect(find.text('ძებნა'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(3));

    await tester.tap(find.byTooltip('უკან'));
    await tester.pumpAndSettle();

    expect(find.text('ძებნა'), findsNothing);
    expect(
      find.text('საქართველოს საარჩევნო ადმინისტრაციის სისტემა'),
      findsOneWidget,
    );
  });

  testWidgets('search form shows errors and formats the mobile number', (
    tester,
  ) async {
    await pumpApp(tester);
    await tester.tap(find.text('ამომრჩევლის ძიება'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('ძებნა'));
    await tester.pumpAndSettle();

    expect(find.text('შეიყვანეთ პირადი ნომერი'), findsOneWidget);
    expect(find.text('შეიყვანეთ გვარი'), findsOneWidget);
    expect(find.text('შეიყვანეთ მობილურის ნომერი'), findsOneWidget);

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), '01001012345');
    await tester.enterText(fields.at(1), 'ბერიძე');
    await tester.enterText(fields.at(2), '599123456');
    await tester.pumpAndSettle();

    expect(find.text('599-12-34-56'), findsOneWidget);
    expect(find.text('შეიყვანეთ პირადი ნომერი'), findsNothing);
    expect(find.text('შეიყვანეთ გვარი'), findsNothing);
    expect(find.text('შეიყვანეთ მობილურის ნომერი'), findsNothing);

    await tester.tap(find.text('ძებნა'));
    await tester.pumpAndSettle();

    expect(find.text('ნიკა ლაჩაშვილი'), findsOneWidget);
  });
}
