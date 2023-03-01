import 'package:flutter/material.dart';
import 'package:rpn_calculator_app/Backend/enum/operators.dart';

import '../../Backend/Command.dart';
import 'calculator_state.dart';
import 'custom_button.dart';

class CalculationScreen extends StatelessWidget {
  final VoidCallback _update;
  final CalculatorState _calState;

  const CalculationScreen(this._calState, this._update, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double sizeBoxHeight = 75;
    const double sizeBoxWidth = 75;
    const Color buttonsColor = Colors.white10;
    const double globalPadding = 4;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(globalPadding),
          child: InkWell(
            onTap: () {
              /// This method enables us to write an infinite digit number
              /// By joining the elements in the list together
              /// After the number parsed from a string gets pushed to the stack
              /// Last the list of strings is cleared
              for (String number in _calState.numberOfStrings) {
                _calState.result += number;
              }
              num numberFromString = num.parse(_calState.result);
              _calState.stack.push(numberFromString);
              _calState.numberOfStrings.clear();
              _calState.result = '';
              _calState.copyStack = [..._calState.stack.numbers];
              _calState.historical.push(_calState.copyStack);
              _update();
            },
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white10.withAlpha(20),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                child: Center(
                  child: Text(
                    "Enter",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 40,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(globalPadding),
                child: InkWell(
                  onTap: () {
                    _calState.numberOfStrings.remove(
                        _calState.numberOfStrings.last);
                    _update();
                  },
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  child: Container(
                    height: 50,
                    width: 150,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white10.withAlpha(20),
                          borderRadius: BorderRadius.all(
                              Radius.circular(50.0))),
                      child: Center(
                        child: Text(
                          "C",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 40,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(globalPadding),
                child: InkWell(
                  onTap: () {
                    _calState.stack.clear();
                    _calState.historical.clear();
                    _calState.numberOfStrings.clear();
                    _update();
                  },
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  child: Container(
                    height: 50,
                    width: 150,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white10.withAlpha(20),
                          borderRadius: BorderRadius.all(
                              Radius.circular(50.0))),
                      child: Center(
                        child: Text(
                          "AC",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 40,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.black,
                fontSize: 30,
                text: '1',
                backGroundColor: buttonsColor,
                onPressed: () {
                  _calState.numberOfStrings.add('1');
                  _calState.numberOfStrings.join('');
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.black,
                fontSize: 30,
                text: '2',
                backGroundColor: buttonsColor,
                onPressed: () {
                  _calState.numberOfStrings.add('2');
                  _calState.numberOfStrings.join('');
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.black,
                fontSize: 30,
                text: '3',
                backGroundColor: buttonsColor,
                onPressed: () {
                  _calState.numberOfStrings.add('3');
                  _calState.numberOfStrings.join('');
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.blue.shade700,
                fontSize: 30,
                text: '+',
                backGroundColor: buttonsColor,
                onPressed: () {
                  calculation(Operator.addition.value);
                  _update();
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.black,
                fontSize: 30,
                text: '4',
                backGroundColor: buttonsColor,
                onPressed: () {
                  _calState.numberOfStrings.add('4');
                  _calState.numberOfStrings.join('');
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.black,
                fontSize: 30,
                text: '5',
                backGroundColor: buttonsColor,
                onPressed: () {
                  _calState.numberOfStrings.add('5');
                  _calState.numberOfStrings.join('');
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.black,
                fontSize: 30,
                text: '6',
                backGroundColor: buttonsColor,
                onPressed: () {
                  _calState.numberOfStrings.add('6');
                  _calState.numberOfStrings.join('');
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.blue.shade700,
                fontSize: 30,
                text: '-',
                backGroundColor: buttonsColor,
                onPressed: () {
                  calculation(Operator.subtraction.value);
                  _update();
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.black,
                fontSize: 30,
                text: '7',
                backGroundColor: buttonsColor,
                onPressed: () {
                  _calState.numberOfStrings.add('7');
                  _calState.numberOfStrings.join('');
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.black,
                fontSize: 30,
                text: '8',
                backGroundColor: buttonsColor,
                onPressed: () {
                  _calState.numberOfStrings.add('8');
                  _calState.numberOfStrings.join('');
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.black,
                fontSize: 30,
                text: '9',
                backGroundColor: buttonsColor,
                onPressed: () {
                  _calState.numberOfStrings.add('9');
                  _calState.numberOfStrings.join('');
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.blue.shade700,
                fontSize: 30,
                text: '/',
                backGroundColor: buttonsColor,
                onPressed: () {
                  calculation(Operator.division.value);
                  _update();
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.orangeAccent,
                fontSize: 20,
                text: 'Undo',
                backGroundColor: buttonsColor,
                onPressed: () {
                  _calState.historical.historicalStack.remove(_calState.historical.historicalStack.last);
                  _calState.stack.numbers = [..._calState.historical.historicalStack.last];
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.black,
                fontSize: 30,
                text: '0',
                backGroundColor: buttonsColor,
                onPressed: () {
                  _calState.numberOfStrings.add('0');
                  _calState.numberOfStrings.join('');
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.black,
                fontSize: 30,
                text: '.',
                backGroundColor: buttonsColor,
                onPressed: () {
                  if(!_calState.numberOfStrings.contains('.')){
                    _calState.numberOfStrings.add('.');
                    _calState.numberOfStrings.join('');
                  }
                  _update();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: CustomButton(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                fontColor: Colors.blue.shade700,
                fontSize: 30,
                text: '*',
                backGroundColor: buttonsColor,
                onPressed: () {
                  calculation(Operator.multiply.value);
                  _update();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void calculation(String operator) {
    num newValue;
    num last = _calState.stack.numbers.last;
    num secondLast = _calState.stack.numbers.elementAt(
        _calState.stack.numbers.length - 2);
    _calState.stack.numbers.remove(last);
    _calState.stack.numbers.remove(secondLast);
    switch (operator) {
      case '+':
        newValue = Addition(last, secondLast).execute();
        _calState.stack.push(newValue);
        break;
      case '-':
        newValue = Subtraction(last, secondLast).execute();
        _calState.stack.push(newValue);
        break;
      case '*':
        newValue = Multiply(last, secondLast).execute();
        _calState.stack.push(newValue);
        break;
      case '/':
        newValue = Division(last, secondLast).execute();
        _calState.stack.push(newValue);
        break;
    }
    _calState.copyStack = [..._calState.stack.numbers];
    _calState.historical.push(_calState.copyStack);
  }
}

