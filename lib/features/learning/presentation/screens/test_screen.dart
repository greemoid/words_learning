import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/common/widgets/rectangle_icon_button.dart';
import 'package:words_learning/core/theme/color_palette.dart';
import 'package:words_learning/features/learning/presentation/widgets/card_container.dart';
import 'package:words_learning/features/learning/presentation/widgets/word_button.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 32),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.2,
                    minHeight: 56,
                    backgroundColor: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    valueColor: AlwaysStoppedAnimation<Color>(
                        ColorPalette.mainFocusColor),
                  ),
                ),
                SizedBox(width: 4),
                RectangleIconButton(
                  icon: Icons.close_rounded,
                  onTap: () {
                    context.pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            CardContainer(textTheme: textTheme, text: 'Front side'),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 3,
                children: [
                  WordButton(text: 'бігти', textTheme: textTheme),
                  WordButton(text: 'сидіти', textTheme: textTheme),
                  WordButton(text: 'гарний', textTheme: textTheme),
                  WordButton(text: 'будь-коли', textTheme: textTheme),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
