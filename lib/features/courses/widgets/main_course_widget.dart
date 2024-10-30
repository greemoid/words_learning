import 'package:flutter/material.dart';
import 'package:words_learning/common/widgets/black_button.dart';
import 'package:words_learning/core/theme/color_palette.dart';

class MainCourseWidget extends StatelessWidget {
  const MainCourseWidget(
      {super.key,
      required this.textTheme,
      required this.courseTitle,
      required this.courseDescription, required this.onTap});

  final TextTheme textTheme;
  final String courseTitle;
  final String courseDescription;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorPalette.mainFocusColor,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child:
                        Image.asset('assets/images/main_course.png', height: 180)),
              ],
            ),
            SizedBox(height: 8),
            Text('⭐ Our main course', style: textTheme.bodySmall?.copyWith(color: Color(0xFF333131))),
            SizedBox(height: 8),
            Text(
              courseTitle,
              style: textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            Text(courseDescription, style: textTheme.bodySmall?.copyWith(color: Color(0xFF333131)), maxLines: 3),
            SizedBox(height: 16),
            BlackButton(
                textButton: 'ENROLL COURSE', onTap: onTap, textTheme: textTheme)
          ],
        ),
      ),
    );
  }
}
