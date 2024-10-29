import 'package:flutter/material.dart';

class TestButton extends StatelessWidget {
  const TestButton({super.key, this.color = Colors.white, required this.text, required this.textTheme, this.textColor = Colors.black});

  final Color color;
  final String text;
  final Color textColor;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
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
