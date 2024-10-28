import 'package:flutter/material.dart';

class SingleSettingsItem extends StatelessWidget {
  const SingleSettingsItem({super.key, required this.textTheme, required this.icon, required this.text});

  final TextTheme textTheme;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      margin: EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            SizedBox(width: 12),
            Expanded(child: Text(text, style: textTheme.bodyMedium)),
            Icon(Icons.navigate_next_outlined),
          ],
        ),
      ),
    );
  }
}
