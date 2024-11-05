import 'package:flutter/material.dart';
import 'package:words_learning/features/learning/presentation/widgets/card_container.dart';

class FlashcardFlip extends StatefulWidget {
  const FlashcardFlip({
    super.key,
    required this.textTheme,
    required this.word,
    required this.definition,
  });

  final TextTheme textTheme;
  final String word;
  final String definition;

  @override
  _FlashcardFlipState createState() => _FlashcardFlipState();
}

class _FlashcardFlipState extends State<FlashcardFlip>
    with SingleTickerProviderStateMixin {
  bool _isFront = true;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final isHalfway = _animation.value > 0.5;
          final angle = isHalfway
              ? (_animation.value - 1) * -3.14159
              : _animation.value * 3.14159;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(angle),
            child: isHalfway ? _buildBackSide() : _buildFrontSide(),
          );
        },
      ),
    );
  }

  Widget _buildFrontSide() {
    return CardContainer(textTheme: widget.textTheme, text: widget.word);
  }

  Widget _buildBackSide() {
    return CardContainer(textTheme: widget.textTheme, text: widget.definition);
  }
}
