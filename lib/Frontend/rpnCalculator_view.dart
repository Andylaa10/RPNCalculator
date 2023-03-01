import 'package:flutter/material.dart';
import 'package:rpn_calculator_app/Frontend/Buttons/calculations_view.dart';
import 'package:rpn_calculator_app/Frontend/stack_view.dart';
import 'Buttons/calculator_state.dart';
import 'input_view.dart';

class RPNCalculatorView extends StatefulWidget {
  RPNCalculatorView({Key? key}) : super(key: key);

  @override
  State<RPNCalculatorView> createState() => _RPNCalculatorViewState();
}

class _RPNCalculatorViewState extends State<RPNCalculatorView> {
  CalculatorState _calculatorState = CalculatorState();

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
            child: //Calculations(),
              CalculationScreen(_calculatorState, ()=> setState(() {} )),
          ),
        ),
      ],
    );
  }

  Widget StackView() {
    return Column(
      children: [
        StackScreen(_calculatorState.historical),
        Divider(
          color: Colors.white,
          height: 10,
        ),
        InputScreen(_calculatorState.numberOfStrings),
      ],
    );
  }
}


