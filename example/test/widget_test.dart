// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';
import 'package:mazarbul/mazarbul.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Save and fetch data test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await Mazarbul().initSp();
    await tester.pumpWidget(const MyApp());

    // Simulate entering data and tapping the save button
    await tester.enterText(find.byType(TextFormField), 'Mazarbul');
    await tester.tap(find.text('Save Data'));
    await tester.pump();

    // Verify if data is correctly saved and fetched
    expect(find.text('Welcome, Mazarbul'), findsOneWidget);
    expect(find.text('Is Logged In: true'), findsOneWidget);
  });
}
