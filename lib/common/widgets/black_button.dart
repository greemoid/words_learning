import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  const BlackButton({
    super.key,
    required this.textButton,
    required this.onTap,
    required this.textTheme,
  });

  final String textButton;
  final TextTheme textTheme;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Text(
              textButton,
              style: textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
