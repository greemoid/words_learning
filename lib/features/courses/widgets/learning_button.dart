import 'package:flutter/material.dart';
import 'package:words_learning/core/theme/color_palette.dart';

class LearningButton extends StatelessWidget {
  const LearningButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
    required this.textTheme,
  });

  final Function() onTap;
  final IconData icon;
  final String label;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 172,
          decoration: BoxDecoration(
            color: ColorPalette.mainFocusColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 48,
                  color: Colors.white,
                ),
                SizedBox(height: 8),
                Text(
                  label,
                  style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
