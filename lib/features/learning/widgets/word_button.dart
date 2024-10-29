import 'package:flutter/material.dart';

class WordButton extends StatelessWidget {
  const WordButton({super.key, this.color = Colors.white, required this.text, required this.textTheme, this.textColor = Colors.black, this.height = 58});

  final Color color;
  final String text;
  final Color textColor;
  final TextTheme textTheme;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      child: Center(child: Text(text, textAlign: TextAlign.center, style: textTheme.bodyMedium?.copyWith(color: textColor))),
    );
  }
}
