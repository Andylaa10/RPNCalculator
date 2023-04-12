// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rpn_calculator_app/Frontend/Buttons/calculations_view.dart';
import 'package:rpn_calculator_app/Frontend/Buttons/custom_button.dart';
import 'package:rpn_calculator_app/Frontend/rpnCalculator_view.dart';

import 'package:rpn_calculator_app/main.dart';

void main() {
  group('When a number is clicked', () {
    testWidgets('Updates the input view, when click on number 1', (WidgetTester tester) async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Act
      // Find the button number 1 by the key btn1
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn1'))));
      // Rebuilds the widget
      await tester.pump();

      // Assert
      // Find the updated/changed widget by the key input
      final result = tester.widget<Text>(find.byKey(Key('input')));
      expect(result.data, equals('1'));
    });
    testWidgets('Updates the input view, when click on number 5', (WidgetTester tester) async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Act
      // Find the button number 5 by the key btn5
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn5'))));
      // Rebuilds the widget
      await tester.pump();

      // Assert
      // Find the updated/changed widget by the key input
      final result = tester.widget<Text>(find.byKey(Key('input')));
      expect(result.data, equals('5'));
    });
  });
  group('When multiply numbers is clicked', () {
    testWidgets('Updates the input view, when click on number 1 and 2', (WidgetTester tester) async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Act
      // Find the button number 1 by the key btn1
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn1'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button number 2 by the key btn1
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Assert
      // Find the updated/changed widget by the key input
      final result = tester.widget<Text>(find.byKey(Key('input')));
      expect(result.data, equals('12'));
    });
    testWidgets('Updates the input view, when click on number 1, 2, . and 3', (WidgetTester tester) async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Act
      // Find the button number 1 by the key btn1
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn1'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button period by the key btnPeriod
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnPeriod'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button number 3 by the key btn3
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn3'))));
      // Rebuilds the widget
      await tester.pump();

      //Assert
      // Find the updated/changed widget by the key input
      final result = tester.widget<Text>(find.byKey(Key('input')));
      expect(result.data, equals('12.3'));
    });
  });
  //TODO calculation (Addition, Subtraction, Multiply, Division)
  //TODO Clear, ClearAll and Undo

}
