import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsrs/fsrs.dart' as f;
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/common/widgets/rectangle_icon_button.dart';
import 'package:words_learning/core/theme/color_palette.dart';
import 'package:words_learning/features/learning/domain/word.dart';
import 'package:words_learning/features/learning/presentation/widgets/flashcard_flip.dart';
import 'package:words_learning/features/learning/presentation/widgets/word_button.dart';
import 'package:words_learning/features/learning/presentation/words_bloc/words_bloc.dart';

class DeepLearningScreen extends StatefulWidget {
  const DeepLearningScreen({super.key});

  @override
  State<DeepLearningScreen> createState() => _DeepLearningScreenState();
}

class _DeepLearningScreenState extends State<DeepLearningScreen> {
  List<Word> words = [];
  int index = 0;
  late int courseId;
  final fsrs = f.FSRS();
  List<Word> learnedWords = [];
  f.Card card = f.Card();

  void nextWord() {
    if (index < words.length - 1) {
      index++;
    } else {
      context.read<WordsBloc>().add(UpdateWordsEvent(words: learnedWords));
      context.pop();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    courseId = GoRouterState.of(context).extra as int;
    context.read<WordsBloc>().add(GetNecessaryWordsEvent(courseId: courseId));

    // words = GoRouterState.of(context).extra as List<Word>;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final schedulingCard = fsrs.repeat(card, DateTime.now());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 32),
        child: BlocConsumer<WordsBloc, WordsState>(
          listener: (context, state) {
            if (state is WordsError) {
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'We encountered some problem...',
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
              );
            }
          },
          builder: (context, state) {
            if (state is WordsLoading) {
              return CircularProgressIndicator();
            } else if (state is WordsSuccess) {
              words = state.words ?? [];

              if (words.isEmpty) {
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
                );
              }
              card = words[index].card;
              return Column(
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
                  SizedBox(height: 24),
                  FlashcardFlip(
                    textTheme: textTheme,
                    word: words[index].word,
                    definition: words[index].definition,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3,
                      children: [
                        WordButton(
                          text: '4 days\nEasy',
                          textTheme: textTheme,
                          textColor: Colors.white,
                          color: ColorPalette.darkBlueColor,
                          onTap: () {
                            final newCard = schedulingCard[f.Rating.easy]!.card;
                            print(newCard);
                            final learnedWord =
                                words[index].copyWith(card: newCard);
                            learnedWords.add(learnedWord);
                            nextWord();

                            setState(() {});
                          },
                        ),
                        WordButton(
                          text: '1 day\nNormal',
                          textTheme: textTheme,
                          textColor: Colors.white,
                          color: ColorPalette.successColor,
                          onTap: () {
                            final newCard = schedulingCard[f.Rating.good]!.card;
                            print(newCard);
                            final learnedWord =
                                words[index].copyWith(card: newCard);
                            learnedWords.add(learnedWord);
                            nextWord();
                            setState(() {});
                          },
                        ),
                        WordButton(
                          text: '10 min\nHard',
                          textTheme: textTheme,
                          textColor: Colors.white,
                          color: ColorPalette.darkYellowColor,
                          onTap: () {
                            final newCard = schedulingCard[f.Rating.hard]!.card;
                            print(newCard);
                            final learnedWord =
                                words[index].copyWith(card: newCard);
                            learnedWords.add(learnedWord);
                            nextWord();
                            setState(() {});
                          },
                        ),
                        WordButton(
                          text: '1 min\nAgain',
                          textTheme: textTheme,
                          textColor: Colors.white,
                          color: ColorPalette.errorColor,
                          onTap: () {
                            final newCard =
                                schedulingCard[f.Rating.again]!.card;
                            print(newCard);
                            final learnedWord =
                                words[index].copyWith(card: newCard);
                            learnedWords.add(learnedWord);
                            nextWord();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
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
              );
            }
          },
        ),
      ),
    );
  }
}
