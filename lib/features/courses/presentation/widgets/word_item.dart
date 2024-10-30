import 'package:flutter/material.dart';
import 'package:text_sizer_plus/text_sizer_plus.dart';
import 'package:words_learning/core/theme/color_palette.dart';

class WordItem extends StatelessWidget {
  const WordItem({
    super.key,
    required this.word,
    required this.definition,
    required this.textTheme,
    required this.value,
  });

  final String word;
  final String definition;
  final double value;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorPalette.mainFocusColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(word, style: textTheme.bodyLarge),
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  value: value,
                  color: ColorPalette.secondaryFocusColor,
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          TextSizerPlus(
            definition,
            style: textTheme.bodySmall,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
