import 'package:flutter/material.dart';
import 'package:text_sizer_plus/text_sizer_plus.dart';
import 'package:words_learning/common/widgets/rectangle_icon_button.dart';
import 'package:words_learning/core/theme/color_palette.dart';

class WordGridGameScreen extends StatefulWidget {
  const WordGridGameScreen({super.key});

  @override
  _WordGridGameScreenState createState() => _WordGridGameScreenState();
}

class _WordGridGameScreenState extends State<WordGridGameScreen> {
  final List<Color> _cardColors = List.generate(9, (_) => Colors.white);
  int? _firstSelectedIndex; // Зберігає індекс першої вибраної картки
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
      // Якщо перша картка ще не вибрана
      setState(() {
        _firstSelectedIndex = index;
        _cardColors[index] =
            ColorPalette.mainFocusColor; // Додаємо виділення для першої картки
      });
    } else if (_firstSelectedIndex != index) {
      // Якщо друга картка вибрана, і вона відрізняється від першої
      bool isMatch = _words[index] == _words[_firstSelectedIndex!];
      setState(() {
        _cardColors[index] =
            isMatch ? ColorPalette.successColor : ColorPalette.errorColor;
        _cardColors[_firstSelectedIndex!] =
            isMatch ? ColorPalette.successColor : ColorPalette.errorColor;
      });

      if (!isMatch) {
        // Якщо картки не співпадають, скидаємо колір через 1 секунду
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _cardColors[index] = Colors.white;
            _cardColors[_firstSelectedIndex!] = Colors.white;
            _firstSelectedIndex = null; // Скидаємо першу вибрану картку
          });
        });
      } else {
        // Якщо картки співпадають, не потрібно їх скидати
        _firstSelectedIndex =
            null; // Скидаємо першу вибрану картку для наступного вибору
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //todo: change naming
          'Puzzle',
          style: textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: RectangleIconButton(icon: Icons.close_rounded, onTap: () {}),
          )
        ],
      ),
      body: GridView.builder(
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
    );
  }
}
