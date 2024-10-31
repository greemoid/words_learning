import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:text_sizer_plus/text_sizer_plus.dart';
import 'package:words_learning/core/common/widgets/rectangle_icon_button.dart';
import 'package:words_learning/core/theme/color_palette.dart';

class MatchingScreen extends StatefulWidget {
  const MatchingScreen({super.key});

  @override
  _MatchingScreenState createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  final List<Color> _cardColors = List.generate(9, (_) => Colors.white);
  int? _firstSelectedIndex;
  final List<String> _words = [
    "Apple",
    "Banana",
    "Cherry",
    "Apple",
    "Banana",
    "Cherry",
    "Grape",
    "Orange",
    "Grape"
  ];

  void _onCardTap(int index) {
    if (_firstSelectedIndex == null) {
      setState(() {
        _firstSelectedIndex = index;
        _cardColors[index] = ColorPalette.mainFocusColor;
      });
    } else if (_firstSelectedIndex != index) {
      bool isMatch = _words[index] == _words[_firstSelectedIndex!];
      setState(() {
        _cardColors[index] =
            isMatch ? ColorPalette.successColor : ColorPalette.errorColor;
        _cardColors[_firstSelectedIndex!] =
            isMatch ? ColorPalette.successColor : ColorPalette.errorColor;
      });

      if (!isMatch) {
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _cardColors[index] = Colors.white;
            _cardColors[_firstSelectedIndex!] = Colors.white;
            _firstSelectedIndex = null;
          });
        });
      } else {
        _firstSelectedIndex = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Matching',
          style: textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: RectangleIconButton(
                icon: Icons.close_rounded,
                onTap: () {
                  context.pop();
                }),
          )
        ],
      ),
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: _words.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              // todo: add check if was pressed
              onTap: () {
                _onCardTap(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _cardColors[index],
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(
                  child: TextSizerPlus(
                    _words[index],
                    style: textTheme.bodyMedium,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
