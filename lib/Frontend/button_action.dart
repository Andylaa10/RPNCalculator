import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;

  final Color backGroundColor;
  final Color fontColor;
  final double fontSize;

  final String text;
  final VoidCallback onPressed;
  const CustomButton({Key? key, required this.text, required this.onPressed, required this.backGroundColor, required this.fontColor, required this.fontSize, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FloatingActionButton(
        backgroundColor: backGroundColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w900, color: fontColor),
        ),

      ),
    );
  }
}
