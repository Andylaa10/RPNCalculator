import 'package:flutter/material.dart';
import 'package:rpn_calculator_app/Backend/Command.dart';
import 'package:rpn_calculator_app/Frontend/button_action.dart';

import '../Backend/Stack.dart';

class RPNCalculatorView extends StatefulWidget {
  RPNCalculatorView({Key? key}) : super(key: key);

  @override
  State<RPNCalculatorView> createState() => _RPNCalculatorViewState();
}

class _RPNCalculatorViewState extends State<RPNCalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            child: StackView(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            child: //ActionButtons()
                ButtonsScreen(),
          ),
        ),
      ],
    );
  }

  StackNum stack = StackNum();
  List<String> numberOfStrings = [];
  List<num> copyStack = [];
  String result = '';
  String operator = '';
  /// This is used to track the all changes
  HistoricalStack historical = HistoricalStack();

  Widget StackView() {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              color: Colors.white10.withAlpha(10),
              child: Center(
                  child: (historical.historicalStack.length == 0) ? Text('') : Text(
                    historical.historicalStack.last.toString(),
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.white,
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Container(
              child: Text(
                numberOfStrings.join(''),
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// This method enables us to write an infinite digit number
  /// By joining the elements in the list together
  /// After the number parsed from a string gets pushed to the stack
  /// Last the list of strings is cleared
  List<num> enter() {
    setState(() {
      for (String number in numberOfStrings) {
        result += number;
      }
      num numberFromString = num.parse(result);
      stack.push(numberFromString);
      numberOfStrings.clear();
      result = '';
      copyStack = [...stack.numbers];
      historical.push(copyStack);
      print(historical.historicalStack.toString());
    });
    return stack.peek();
  }

  void clear() {
    setState(() {
      numberOfStrings.clear();
    });
  }

  void clearAll() {
    setState(() {
      stack.clear();
      historical.clear();
    });
  }

  void calculation(String operator){
    num newValue;
    setState(() {
      num last = stack.numbers.last;
      num secondLast = stack.numbers.elementAt(stack.numbers.length-2);
      stack.numbers.remove(last);
      stack.numbers.remove(secondLast);
      switch(operator){
        case '+':
          newValue = Addition(last, secondLast).execute();
          stack.push(newValue);
          break;
        case '-':
          newValue = Subtraction(last, secondLast).execute();
          stack.push(newValue);
          break;
        case '*':
          newValue = Multiply(last, secondLast).execute();
          stack.push(newValue);
          break;
        case '/':
          newValue = Division(last, secondLast).execute();
          stack.push(newValue);
          break;
      }
      copyStack = [...stack.numbers];
      historical.push(copyStack);
    });

  }

  void undo() {
    setState(() {
      historical.historicalStack.remove(historical.historicalStack.last);
      stack.numbers = [...historical.historicalStack.last];
    });
  }

  Widget ButtonsScreen() {
    final double sizeBoxHeight = 75;
    final double sizeBoxWidth = 75;
    final Color buttonsColor = Colors.white10;
    final double globalPadding = 4;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(globalPadding),
          child: InkWell(
            onTap: () {
              enter();
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
                    clear();
                  },
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  child: Container(
                    height: 50,
                    width: 150,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white10.withAlpha(20),
                          borderRadius: BorderRadius.all(Radius.circular(50.0))),
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
                    clearAll();
                  },
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  child: Container(
                    height: 50,
                    width: 150,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white10.withAlpha(20),
                          borderRadius: BorderRadius.all(Radius.circular(50.0))),
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
                onPressed: (){
                  numberOfStrings.add('1');
                  setState(() {
                    numberOfStrings.join('');
                  });
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
                onPressed: (){
                  numberOfStrings.add('2');
                  setState(() {
                    numberOfStrings.join('');
                  });
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
                onPressed: (){
                  numberOfStrings.add('3');
                  setState(() {
                    numberOfStrings.join('');
                  });
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
                onPressed: (){
                  operator = '+';
                  calculation(operator);
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
                onPressed: (){
                  numberOfStrings.add('4');
                  setState(() {
                    numberOfStrings.join('');
                  });
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
                onPressed: (){
                  numberOfStrings.add('5');
                  setState(() {
                    numberOfStrings.join('');
                  });
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
                onPressed: (){
                  numberOfStrings.add('6');
                  setState(() {
                    numberOfStrings.join('');
                  });
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
                onPressed: (){
                  operator = '-';
                  calculation(operator);
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
                onPressed: (){
                  numberOfStrings.add('7');
                  setState(() {
                    numberOfStrings.join('');
                  });
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
                onPressed: (){
                  numberOfStrings.add('8');
                  setState(() {
                    numberOfStrings.join('');
                  });
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
                onPressed: (){
                  numberOfStrings.add('9');
                  setState(() {
                    numberOfStrings.join('');
                  });
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
                onPressed: (){
                  operator = '/';
                  calculation(operator);
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
                onPressed: (){
                  undo();
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
                onPressed: (){
                  numberOfStrings.add('0');
                  setState(() {
                    numberOfStrings.join('');
                  });
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
                onPressed: (){
                  numberOfStrings.add('.');
                  setState(() {
                    numberOfStrings.join('');
                  });
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
                onPressed: (){
                  operator = '*';
                  calculation(operator);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
