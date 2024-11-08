import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsrs/fsrs.dart' as f;
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/common/widgets/rectangle_icon_button.dart';
import 'package:words_learning/core/theme/color_palette.dart';
import 'package:words_learning/features/learning/domain/word.dart';
import 'package:words_learning/features/learning/presentation/learning_words_bloc/learning_words_bloc.dart';
import 'package:words_learning/features/learning/presentation/widgets/no_words_widget.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({super.key});

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  final _controller = TextEditingController();
  List<Word> words = [];
  int index = 0;
  late int courseId;
  final fsrs = f.FSRS();
  List<Word> learnedWords = [];
  f.Card card = f.Card();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    courseId = GoRouterState.of(context).extra as int;

    context
        .read<LearningWordsBloc>()
        .add(GetLearningWordsEvent(courseId: courseId));
  }

  void nextWord() {
    if (index < words.length - 1) {
      // context
      //     .read<LearningWordsBloc>()
      //     .add(UpdateLearningWordEvent(word: learnedWords[index]));
      index++;
    } else {
      // context
      //     .read<LearningWordsBloc>()
      //     .add(UpdateLearningWordEvent(word: learnedWords[index--]));
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final schedulingCard = fsrs.repeat(card, DateTime.now());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 32),
        child: BlocConsumer<LearningWordsBloc, LearningWordsState>(
          listener: (context, state) {
            NoWordsWidget(textTheme: textTheme);
          },
          builder: (context, state) {
            if (state is LearningWordsLoading) {
              return CircularProgressIndicator();
            } else if (state is LearningWordsSuccess) {
              words = state.words ?? [];
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: words.isEmpty
                    ? NoWordsWidget(textTheme: textTheme)
                    : Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: 0.2,
                                  minHeight: 56,
                                  backgroundColor: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9)),
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
                          Text(words[index].definition,
                              style: textTheme.titleMedium),
                          SizedBox(height: 48),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                              child: TextField(
                                cursorColor: Colors.black,
                                autofocus: true,
                                onChanged: (value) {
                                  if (value.trim() == words[index].word) {
                                    final newCard =
                                        schedulingCard[f.Rating.easy]!.card;
                                    print(newCard);
                                    final learnedWord =
                                        words[index].copyWith(card: newCard);
                                    learnedWords.add(learnedWord);
                                    context.read<LearningWordsBloc>().add(
                                        UpdateLearningWordEvent(
                                            word: learnedWord));
                                    _controller.text = '';
                                    nextWord();
                                  }
                                },
                                textAlign: TextAlign.center,
                                controller: _controller,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  final newCard =
                                      schedulingCard[f.Rating.again]!.card;
                                  print(newCard);
                                  final learnedWord =
                                      words[index].copyWith(card: newCard);
                                  learnedWords.add(learnedWord);
                                  context.read<LearningWordsBloc>().add(
                                      UpdateLearningWordEvent(
                                          word: learnedWord));
                                  nextWord();
                                },
                                child: Text(
                                  'Can\'t remember...',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: ColorPalette.errorColor
                                        .withOpacity(0.7),
                                  ),
                                )),
                          )
                        ],
                      ),
              );
            } else {
              return NoWordsWidget(textTheme: textTheme);
            }
          },
        ),
      ),
    );
  }
}
