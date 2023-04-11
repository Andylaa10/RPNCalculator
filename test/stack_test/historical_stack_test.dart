import 'package:flutter_test/flutter_test.dart';
import 'package:rpn_calculator_app/Backend/Stack.dart';



void main(){
  group('Historical stack', () {
    late HistoricalStack hStack;
    List<num> mockData1 = [1,2];
    List<num> mockData2 = [1];
    List<num> mockToAdd = [4];
    setUp(() {
      //Arrange
      hStack = HistoricalStack();
      
      //Mock data
      hStack.historicalStack.add(mockData1);
      hStack.historicalStack.add(mockData2);
    });
    
    test('Peek(), return List of list of numbers', () {
      //Act
      var result = hStack.peek();
      //Assert
      expect(result.length, equals(2));
    });

    test('Push(), adds a new element to the list', () {
      //Act
      hStack.push(mockToAdd);

      //Assert
      expect(hStack.historicalStack.length, equals(3));
    });

    test('Pop(), removes an element from the list', () {
      //Act
      hStack.pop(mockData2);

      //Assert
      expect(hStack.historicalStack.length, equals(1));
    });

    test('Clear(), removes all elements from the list', () {
      //Act
      hStack.clear();

      //Assert
      expect(hStack.historicalStack.length, equals(0));
    });
  });

}