
import 'package:flutter/material.dart';
import 'package:words_learning/core/theme/color_palette.dart';

class StreakWidget extends StatelessWidget {
  const StreakWidget({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorPalette.secondaryFocusColor,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Padding(
        padding: const EdgeInsets.all(12).copyWith(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1\nday',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),
                Icon(
                  Icons.local_fire_department_outlined,
                  size: 38,
                )
              ],
            ),
            SizedBox(height: 16),
            Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // Center the Row
                  children: days.map((day) {
                    return Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      // Add padding for aesthetics
                      // margin: const EdgeInsets.symmetric(horizontal: 8),
                      // Add some margin between items
                      child: Text(day),
                    );
                  }).toList(),
                ))
          ],
        ),
      ),
    );
  }
}
