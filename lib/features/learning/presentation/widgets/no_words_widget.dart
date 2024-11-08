
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoWordsWidget extends StatelessWidget {
  const NoWordsWidget({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'There no words for today',
            style: textTheme.bodyMedium,
          ),
        ),
        SizedBox(height: 32),
        OutlinedButton(
          onPressed: () => context.pop(),
          child: Text(
            'Go home',
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );;
  }
}
