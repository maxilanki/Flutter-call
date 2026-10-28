import 'package:flutter/material.dart';
import 'package:flutter_calls/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows three navigation destinations', (tester) async {
    await tester.pumpWidget(const CallsApp());

    expect(
      find.widgetWithText(NavigationDestination, 'Peoples'),
      findsOneWidget,
    );
    expect(find.widgetWithText(NavigationDestination, 'Chats'), findsOneWidget);
    expect(find.widgetWithText(NavigationDestination, 'Calls'), findsOneWidget);
    expect(find.text('Ana García'), findsWidgets);
  });

  testWidgets('changes tab through the bottom navigation', (tester) async {
    await tester.pumpWidget(const CallsApp());

    await tester.tap(find.widgetWithText(NavigationDestination, 'Calls'));
    await tester.pump();

    expect(find.text('Calls'), findsWidgets);
    expect(find.text('Carlos Ruiz'), findsWidgets);
  });
}
