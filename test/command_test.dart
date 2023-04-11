import 'package:flutter_test/flutter_test.dart';
import 'package:rpn_calculator_app/Backend/Command.dart';

void main(){
  group('Command ', () {
    late Addition addition;
    late Subtraction subtraction;
    late Multiply multiply;
    late Division division;
    late num result;
    
    setUp(() {
      addition = Addition(1, 2);
      subtraction = Subtraction(2, 1);
      multiply = Multiply(2, 2);
      division = Division(2, 2);
    });
    
    test('Addition(), adds two numbers', () {
      //Act
      result = addition.execute();
      //Assert
      expect(result, equals(3));
    });

    test('Subtraction(), subtract two numbers', () {
      //Act
      result = subtraction.execute();
      //Assert
      expect(result, equals(1));
    });

    test('Multiply(), multiply two numbers ', () {
      //Act
      result = multiply.execute();
      //Assert
      expect(result, equals(4));
    });

    test('Division(), divide two numbers ', () {
      //Act
      result = division.execute();
      //Assert
      expect(result, equals(1));
    });
  });

}