import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  final List<String> numberOfStrings;
  const InputScreen(this.numberOfStrings,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            child: (numberOfStrings.length == 0) ? Text('0', style: TextStyle(color: Colors.white, fontSize: 30)):Text(
              numberOfStrings.join(''),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
