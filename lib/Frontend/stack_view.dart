import 'package:flutter/material.dart';

import '../Backend/Stack.dart';

class StackScreen extends StatelessWidget {
  final HistoricalStack historical;
  const StackScreen(this.historical, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: Center(
        child: (historical.historicalStack.length == 0) ? Text('') : Text(
          historical.historicalStack.last.toString(),
          softWrap: true,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
