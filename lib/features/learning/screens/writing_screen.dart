import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:words_learning/common/widgets/rectangle_icon_button.dart';
import 'package:words_learning/core/theme/color_palette.dart';

class WritingScreen extends StatelessWidget {
  WritingScreen({super.key});

  final _controller = TextEditingController();

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
            SizedBox(height: 124),
            Text('Спускатися', style: textTheme.titleMedium),
            SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: TextField(
                  cursorColor: Colors.black,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  controller: _controller,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Text(
                  'Can\'t remember...',
                  style: textTheme.bodySmall?.copyWith(
                    color: ColorPalette.errorColor.withOpacity(0.7),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
