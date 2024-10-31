import 'package:flutter/material.dart';
import 'package:words_learning/core/common/widgets/light_grey_divider.dart';

class MultipleSettingsItem extends StatelessWidget {
  const MultipleSettingsItem({
    super.key,
    required this.textTheme,
    required this.texts,
    required this.icons,
  });

  final TextTheme textTheme;
  final List<IconData> icons;
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12).copyWith(right: 0),
        child: Column(
          children: List.generate(texts.length, (index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(icons[index]),
                    SizedBox(width: 12),
                    Expanded(child: Text(texts[index], style: textTheme.bodyMedium)),
                    Icon(Icons.navigate_next_outlined),
                    SizedBox(width: 12),
                  ],
                ),
                if (index != texts.length - 1) // Add divider for all but the last item
                  Row(
                    children: [
                      // todo: take icon size + paddings
                      SizedBox(width: 32), // Adjust to match icon + padding width
                      Expanded(child: LightGreyDivider()),
                    ],
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
