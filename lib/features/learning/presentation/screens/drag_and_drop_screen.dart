import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/common/widgets/rectangle_icon_button.dart';
import 'package:words_learning/core/theme/color_palette.dart';
import 'package:words_learning/features/learning/presentation/widgets/word_button.dart';

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({super.key});

  @override
  State<DragAndDropScreen> createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  String droppedWord = '';
  final wordList = [
    'to run',
    'to run',
    'to run',
    'to run',
    'to run',
    'to run',
    'to run'
  ];
  List<String> words = [
    'бігати',
    'дякую',
    'плавання',
    'наступний',
    'бігання',
    'приймати участь',
    'гарний'
  ];
  List<String?> droppedWords =
      List.filled(7, null); // To track words in drop zones

  void _itemDroppedOnTarget(int index, String word) {
    setState(() {
      droppedWords[index] = word;
      words.remove(word); // Remove the word from the list of draggable items
    });
  }

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
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorPalette.mainFocusColor,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                RectangleIconButton(
                  icon: Icons.close_rounded,
                  onTap: () {
                    context.pop();
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: wordList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                height: 46,
                                decoration: BoxDecoration(
                                  color: wordList[index] != null
                                      ? ColorPalette.mainFocusColor
                                      : Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  wordList[index] ?? '',
                                  style: textTheme.bodyMedium?.copyWith(
                                      color: wordList[index] != null
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: wordList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: DragTarget<String>(
                                builder:
                                    (context, candidateData, rejectedData) {
                                  return Container(
                                    height: 46,
                                    decoration: BoxDecoration(
                                      color: droppedWords[index] != null
                                          ? ColorPalette.mainFocusColor
                                          : Colors.grey,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(18),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      droppedWords[index] ?? '',
                                      style: textTheme.bodyMedium?.copyWith(
                                          color: droppedWords[index] != null
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  );
                                },
                                onAcceptWithDetails: (data) {
                                  _itemDroppedOnTarget(index, data.data);
                                },
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              flex: 1,
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2.7,
                physics: const NeverScrollableScrollPhysics(),
                children: words
                    .map((word) => LongPressDraggable<String>(
                          data: word,
                          feedback: Material(
                            color: Colors.transparent,
                            child: WordButton(
                              onTap: () {},
                              text: word,
                              textTheme: textTheme,
                              width: 70,
                              color: ColorPalette.mainFocusColor,
                            ),
                          ),
                          childWhenDragging: Opacity(
                            opacity: 0.3,
                            child: WordButton(
                              onTap: () {},
                              text: word,
                              textTheme: textTheme,
                            ),
                          ),
                          child: WordButton(
                            onTap: () {},
                            text: word,
                            textTheme: textTheme,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
