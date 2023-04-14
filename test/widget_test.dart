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
  group('Calculations', () {
    testWidgets('Addition(), add 2 numbers', (WidgetTester tester) async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Find the button number 1 by the key btn1
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn1'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();
      // Find the button number 3 by the key btn3
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn3'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();

      //Act
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnAddition'))));
      await tester.pump();

      //Assert
      // Find the updated/changed widget by the key stack
      final result = tester.widget<Text>(find.byKey(Key('stack')));
      expect(result.data, equals('[4]'));
    });
    testWidgets('Subtraction(), subtract 2 numbers', (WidgetTester tester) async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Find the button number 1 by the key btn1
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn1'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();
      // Find the button number 3 by the key btn3
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn3'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();

      //Act
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnSubtraction'))));
      await tester.pump();

      //Assert
      // Find the updated/changed widget by the key stack
      final result = tester.widget<Text>(find.byKey(Key('stack')));
      expect(result.data, equals('[2]'));
    });
    testWidgets('Multiply(), multiply 2 numbers', (WidgetTester tester) async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();
      // Find the button number 3 by the key btn3
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn3'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();

      //Act
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnMultiply'))));
      await tester.pump();

      //Assert
      // Find the updated/changed widget by the key stack
      final result = tester.widget<Text>(find.byKey(Key('stack')));
      expect(result.data, equals('[6]'));
    });

    testWidgets('Division(), divide 2 numbers', (WidgetTester tester) async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();
      // Find the button number 3 by the key btn3
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn3'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();

      //Act
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnDivision'))));
      await tester.pump();

      //Assert
      // Find the updated/changed widget by the key stack
      final result = tester.widget<Text>(find.byKey(Key('stack')));
      expect(result.data, equals('[1.5]'));
    });
  });
  //TODO Enter, Clear, ClearAll and Undo
  group('Enter, Clear, ClearAll and Undo Test', () {
    testWidgets('Enter(), pushes number into the stack', (WidgetTester tester)  async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Act
      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();

      //Assert
      // Find the updated/changed widget by the key stack
      final result = tester.widget<Text>(find.byKey(Key('stack')));
      expect(result.data, equals('[2]'));
    });
    testWidgets('Clear(), clears the input when one number is entered', (WidgetTester tester)  async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Act
      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnClear'))));
      // Rebuilds the widget
      await tester.pump();

      //Assert
      // Find the updated/changed widget by the key input
      final result = tester.widget<Text>(find.byKey(Key('input')));
      expect(result.data, equals('0'));
    });
    testWidgets('Clear(), clears the input when more numbers is entered', (WidgetTester tester)  async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();
      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();
      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Act
      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnClear'))));
      // Rebuilds the widget
      await tester.pump();

      //Assert
      // Find the updated/changed widget by the key input
      final result = tester.widget<Text>(find.byKey(Key('input')));
      expect(result.data, equals('22'));
    });

    testWidgets('ClearAll(), clears both the stack and input ', (WidgetTester tester)  async {
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Act
      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnClearAll'))));
      // Rebuilds the widget
      await tester.pump();

      //Assert
      // Find the updated/changed widget by the key input
      final result = tester.widget<Text>(find.byKey(Key('input')));
      expect(result.data, equals('0'));

      // Find the updated/changed widget by the key stack
      final resultStack = tester.widget<Text>(find.byKey(Key('stack')));
      expect(resultStack.data, equals(''));
    });

    testWidgets('Undo(), goes back to the previous stack by looking a the history of the stack', (WidgetTester tester) async{
      // Arrange
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RPNCalculatorView()),
      ));

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button number 2 by the key btn2
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btn2'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnEnter'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the button addition by the key btnAddition to add 2 numbers in the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnAddition'))));
      // Rebuilds the widget
      await tester.pump();

      // Find the updated/changed widget by the key stack
      final result = tester.widget<Text>(find.byKey(Key('stack')));
      expect(result.data, equals('[2, 4]'));

      // Now the stack is [2,2,2]
      // Now we we'll press addition so the now stack becomes [2,4]
      // But after we press Undo() the stack becomes [2,2,2]

      // Act
      // Find the button enter by the key btnEnter to push number to the stack
      await tester.tap(find.descendant(of: find.byType(CalculationScreen), matching: find.byKey(ValueKey('btnUndo'))));
      // Rebuilds the widget
      await tester.pump();

      //Assert
      // Find the updated/changed widget by the key stack
      final resultAfterUndo = tester.widget<Text>(find.byKey(Key('stack')));
      expect(resultAfterUndo.data, equals('[2, 2, 2]'));
    });
  });

}
