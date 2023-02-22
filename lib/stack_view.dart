import 'package:flutter/material.dart';

class StackView extends StatefulWidget {
  const StackView({Key? key}) : super(key: key);

  @override
  State<StackView> createState() => _StackViewState();
}

class _StackViewState extends State<StackView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10.withAlpha(10),
    );
  }
}
