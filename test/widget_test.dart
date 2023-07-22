// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kisayibul/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
 // <-- Proje adınıza göre düzenleyin

void main() {
  testWidgets('En kısa ismi doğru şekilde gösteriyor mu', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final inputButtonFinder = find.byType(ElevatedButton);
    expect(inputButtonFinder, findsOneWidget);

    await tester.tap(inputButtonFinder);
    await tester.pump();

    final nameInput1 = "John";
    final nameInput2 = "Emma";
    final nameInput3 = "Michael";

    final nameInputField1 = find.byKey(Key('name_input_1'));
    final nameInputField2 = find.byKey(Key('name_input_2'));
    final nameInputField3 = find.byKey(Key('name_input_3'));

    await tester.enterText(nameInputField1, nameInput1);
    await tester.enterText(nameInputField2, nameInput2);
    await tester.enterText(nameInputField3, nameInput3);

    final displayTextFinder = find.text('En Kısa İsim:');
    expect(displayTextFinder, findsOneWidget);

    final shortestNameFinder = find.text('Michael');
    expect(shortestNameFinder, findsOneWidget);
  });
}

