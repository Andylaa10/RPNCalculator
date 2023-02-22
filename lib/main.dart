import 'package:flutter/material.dart';
import 'package:rpn_calculator_app/stack_view.dart';

import 'action_buttons_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'RPN Calculator',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
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
                  child: ActionButtons()),
            ),
          ],
        ),
      ),
    );
  }
}
