import 'package:flutter_test/flutter_test.dart';
import 'package:rpn_calculator_app/Backend/Stack.dart';

void main(){
  group('Stack num', () {
    late StackNum stackNum;
    num mockData1 = 1;
    num mockData2 = 2;
    num mockToAdd = 3;
    setUp(() {
      //Arrange
      stackNum = StackNum();

      //Mock data
      stackNum.numbers.add(mockData1);
      stackNum.numbers.add(mockData2);
    });

    test('Peek(), return list of numbers', () {
      //Act
      var result = stackNum.peek();
      //Assert
      expect(result.length, equals(2));
    });

    test('Push(), adds a new element to the list', () {
      //Act
      stackNum.push(mockToAdd);

      //Assert
      expect(stackNum.numbers.length, equals(3));
    });

    test('Pop(), removes an element from the list', () {
      //Act
      stackNum.pop(mockData2);

      //Assert
      expect(stackNum.numbers.length, equals(1));
    });

    test('Clear(), removes all elements from the list', () {
      //Act
      stackNum.clear();

      //Assert
      expect(stackNum.numbers.length, equals(0));
    });
  });
}