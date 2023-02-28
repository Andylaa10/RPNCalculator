import 'package:flutter/material.dart';
import 'package:rpn_calculator_app/Backend/Command.dart';

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
          flex: 3,
          child: Center(
            child: Container(
              color: Colors.white10.withAlpha(10),
              child: Center(
                  child: (historical.historicalStack.length == 0) ? Text('') : Text(
                    historical.historicalStack.last.toString(),
                    style: TextStyle(fontSize: 24, color: Colors.white),
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
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ScrollController controller = new ScrollController();
  list() {
    return Scaffold(
      body: ListView.builder(
          itemCount: historical.historicalStack.length,
          controller: controller,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                //trailing: Text('$index', style: TextStyle(color: Colors.green, fontSize: 15),),
                title: Center(
                  child: Text(
                    historical.historicalStack[index].toString(),
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            );
          }),
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
          copyStack = [...stack.numbers];
          historical.push(copyStack);
          break;
        case '-':
          newValue = Subtraction(last, secondLast).execute();
          stack.push(newValue);
          copyStack = [...stack.numbers];
          historical.push(copyStack);
          break;
        case '*':
          newValue = Subtraction(last, secondLast).execute();
          stack.push(newValue);
          copyStack = [...stack.numbers];
          historical.push(copyStack);
          break;
        case '/':
          newValue = Subtraction(last, secondLast).execute();
          stack.push(newValue);
          copyStack = [...stack.numbers];
          historical.push(copyStack);
          break;
      }
    });

  }

  void undo() {
    controller.animateTo(
      60.0 * historical.historicalStack.length,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
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
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    numberOfStrings.add('1');
                    setState(() {
                      numberOfStrings.join('');
                    });
                  },
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    numberOfStrings.add('2');
                    setState(() {
                      numberOfStrings.join('');
                    });
                  },
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    numberOfStrings.add('3');
                    setState(() {
                      numberOfStrings.join('');
                    });
                  },
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    operator = '+';
                    calculation(operator);
                  },
                  child: Text(
                    '+',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.blue.shade700),
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
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    numberOfStrings.add('4');
                    setState(() {
                      numberOfStrings.join('');
                    });
                  },
                  child: Text(
                    '4',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    numberOfStrings.add('5');
                    setState(() {
                      numberOfStrings.join('');
                    });
                  },
                  child: Text(
                    '5',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    numberOfStrings.add('6');
                    setState(() {
                      numberOfStrings.join('');
                    });
                  },
                  child: Text(
                    '6',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    operator = '-';
                    calculation(operator);
                  },
                  child: Text(
                    '-',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.blue.shade700),
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
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    numberOfStrings.add('7');
                    setState(() {
                      numberOfStrings.join('');
                    });
                  },
                  child: Text(
                    '7',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    numberOfStrings.add('8');
                    setState(() {
                      numberOfStrings.join('');
                    });
                  },
                  child: Text(
                    '8',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    numberOfStrings.add('9');
                    setState(() {
                      numberOfStrings.join('');
                    });
                  },
                  child: Text(
                    '9',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    operator = '/';
                    calculation(operator);
                  },
                  child: Text(
                    '/',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.blue.shade700),
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
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    undo();
                  },
                  child: Text(
                    'Undo',
                    style: TextStyle(fontSize: 20, color: Colors.orange,fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    numberOfStrings.add('0');
                    setState(() {
                      numberOfStrings.join('');
                    });
                  },
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    numberOfStrings.add('.');
                    setState(() {
                      numberOfStrings.join('');
                    });
                  },
                  child: Text(
                    '.',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(globalPadding),
              child: SizedBox(
                height: sizeBoxHeight,
                width: sizeBoxWidth,
                child: FloatingActionButton(
                  backgroundColor: buttonsColor,
                  onPressed: () {
                    operator = '*';
                    calculation(operator);
                  },
                  child: Text(
                    '*',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.blue.shade700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
