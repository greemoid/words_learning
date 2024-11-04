import 'package:flutter/material.dart';
import 'package:text_sizer_plus/text_sizer_plus.dart';
import 'package:words_learning/core/theme/color_palette.dart';

class SecondaryCourseWidget extends StatelessWidget {
  const SecondaryCourseWidget(
      {super.key,
      required this.onTap,
      required this.wordsCount,
      required this.courseTitle,
      required this.textTheme});

  final Function() onTap;
  final int wordsCount;
  final String courseTitle;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      decoration: BoxDecoration(
        color: ColorPalette.secondaryFocusColor,
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$wordsCount words', style: textTheme.bodySmall,),
            SizedBox(height: 32),
            Flexible(child: TextSizerPlus(courseTitle, style: textTheme.titleMedium?.copyWith(overflow: TextOverflow.ellipsis), maxLines: 3)),
          ],
        ),
      ),
    );
  }
}
