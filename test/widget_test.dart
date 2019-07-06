import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

import 'package:whatisathome/main.dart';

void main() {
  testWidgets('ListView smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // The Alma category is rendered.
    expect(find.text('Alma'), findsOneWidget);
    // Find the last category
    var last = find.byType(Card).last;
    // Scroll if it isn't visible
    await tester.ensureVisible(last);

    // Tap the last CategoryCard and trigger a frame.
    await tester.tap(last);
    await tester.pump();
  });
}
