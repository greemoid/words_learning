// import 'package:flutter/material.dart';
// import 'package:words_learning/common/widgets/rectangle_icon_button.dart';
// import 'package:words_learning/core/theme/color_palette.dart';
// import 'package:words_learning/features/learning/widgets/word_button.dart';
//
// class DragAndDropScreen extends StatefulWidget {
//   const DragAndDropScreen({super.key});
//
//   @override
//   State<DragAndDropScreen> createState() => _DragAndDropScreenState();
// }
//
// class _DragAndDropScreenState extends State<DragAndDropScreen> {
//   String droppedWord = '';
//   void _itemDroppedOnCustomerCart({
//     required String word,
//   }) {
//     setState(() {
//       droppedWord = word;
//       print(droppedWord);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;
//     final List<String> words = [
//       'бігати',
//       'дякую',
//       'плавання',
//       'наступний',
//       'бігання',
//       'приймати участь',
//       'гарний'
//     ];
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 32),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: LinearProgressIndicator(
//                     value: 0.2,
//                     minHeight: 56,
//                     backgroundColor: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(9)),
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                         ColorPalette.mainFocusColor),
//                   ),
//                 ),
//                 SizedBox(width: 4),
//                 RectangleIconButton(
//                   icon: Icons.close_rounded,
//                   onTap: () {},
//                 ),
//               ],
//             ),
//             SizedBox(height: 24),
//             Container(
//               height: 480,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(18),
//                 ),
//               ),
//               child: GridView.count(
//                 crossAxisCount: 2,
//
//                 mainAxisSpacing: 8,
//                 crossAxisSpacing: 8,
//                 childAspectRatio: 3.3,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   WordButton(
//                       text: 'to run',
//                       textTheme: textTheme,
//                       color: ColorPalette.mainFocusColor),
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(18),
//                       ),
//                     ),
//                   ),
//                   WordButton(
//                       text: 'to run',
//                       textTheme: textTheme,
//                       color: ColorPalette.mainFocusColor),
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(18),
//                       ),
//                     ),
//                   ),
//                   WordButton(
//                       text: 'to run',
//                       textTheme: textTheme,
//                       color: ColorPalette.mainFocusColor),
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(18),
//                       ),
//                     ),
//                   ),
//                   WordButton(
//                       text: 'to run',
//                       textTheme: textTheme,
//                       color: ColorPalette.mainFocusColor),
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(18),
//                       ),
//                     ),
//                   ),
//                   WordButton(
//                       text: 'to run',
//                       textTheme: textTheme,
//                       color: ColorPalette.mainFocusColor),
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(18),
//                       ),
//                     ),
//                   ),
//                   WordButton(
//                       text: 'to run',
//                       textTheme: textTheme,
//                       color: ColorPalette.mainFocusColor),
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(18),
//                       ),
//                     ),
//                   ),
//                   WordButton(
//                       text: 'to run',
//                       textTheme: textTheme,
//                       color: ColorPalette.mainFocusColor),
//                   DragTarget<String>(
//                     builder: (context, candidateItems, rejectedItems) {
//                       return WordButton(text: droppedWord, textTheme: textTheme, color: Colors.red,);
//                     },
//                     onAcceptWithDetails: (details) {
//                       _itemDroppedOnCustomerCart(
//                         word: details.data
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 32),
//
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 3,
//                 // Number of columns
//                 mainAxisSpacing: 8,
//                 crossAxisSpacing: 8,
//                 childAspectRatio: 2.7,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: words
//                     .map((word) => LongPressDraggable<String>(feedback: WordButton(text: word, textTheme: textTheme, width: 70,),
//                       child: WordButton(
//                             text: word,
//                             textTheme: textTheme,
//                           ),
//                     ))
//                     .toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
            Container(
              height: 300,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(18)),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 3.3,
                ),
                itemCount: droppedWords.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return DragTarget<String>(
                    builder: (context, candidateData, rejectedData) {
                      return Container(
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
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
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
                              text: word,
                              textTheme: textTheme,
                              width: 70,
                              color: ColorPalette.mainFocusColor,
                            ),
                          ),
                          childWhenDragging: Opacity(
                            opacity: 0.3,
                            child: WordButton(
                              text: word,
                              textTheme: textTheme,
                            ),
                          ),
                          child: WordButton(
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
