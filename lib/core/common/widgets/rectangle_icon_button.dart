import 'package:flutter/material.dart';

class RectangleIconButton extends StatelessWidget {
  const RectangleIconButton(
      {super.key, required this.icon, required this.onTap});

  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // todo: there is nothing to pop error; may be I should fix go_router
      onTap: onTap,
      child: Container(
        height: 56,
        width: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Icon(icon, size: 48),
      ),
    );
  }
}
