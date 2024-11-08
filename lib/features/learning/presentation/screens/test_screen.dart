import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/common/widgets/rectangle_icon_button.dart';
import 'package:words_learning/core/theme/color_palette.dart';
import 'package:words_learning/features/learning/domain/word.dart';
import 'package:words_learning/features/learning/presentation/learning_words_bloc/learning_words_bloc.dart';
import 'package:words_learning/features/learning/presentation/screens/course_screen.dart';
import 'package:words_learning/features/learning/presentation/widgets/card_container.dart';
import 'package:words_learning/features/learning/presentation/widgets/no_words_widget.dart';
import 'package:words_learning/features/learning/presentation/widgets/word_button.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<String> definitions = [];
  List<String> answers = [];
  List<Word> words = [];
  int index = 0;
  String? selectedAnswer;
  bool isAnswerChecked = false;
  bool isCorrect = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final extras = GoRouterState.of(context).extra as TestExtras;
    definitions = extras.definitions;
    context
        .read<LearningWordsBloc>()
        .add(GetLearningWordsEvent(courseId: extras.courseId));
  }

  void nextWord() {
    if (index < words.length - 1) {
      setState(() {
        index++;
        isAnswerChecked = false; // Reset the answer check state for next word
      });
      generateAnswers(); // Regenerate answers for the next word
    } else {
      context.pop();
    }
  }

  void generateAnswers() {
    answers.clear();
    if (words.isNotEmpty && index < words.length) {
      // Add the correct answer
      answers.add(words[index].definition);

      // Add 3 random wrong answers
      Random random = Random();
      while (answers.length < 4) {
        var randomIndex = random.nextInt(definitions.length);
        var result = definitions[randomIndex];
        if (result != words[index].definition && !answers.contains(result)) {
          answers.add(result);
        }
      }
      answers.shuffle(); // Shuffle answers to ensure randomness
    }
  }

  void checkAnswer(String selectedAnswer) {
    setState(() {
      this.selectedAnswer = selectedAnswer;
      isCorrect = selectedAnswer == words[index].definition;
      isAnswerChecked = true;
    });

    // Delay before moving to the next word to allow for color change visibility
    Future.delayed(const Duration(milliseconds: 500), nextWord);
  }

  Color getButtonColor(String answer) {
    if (isAnswerChecked) {
      if (answer == selectedAnswer) {
        return isCorrect ? Colors.green : Colors.red;
      } else if (answer == words[index].definition) {
        return Colors.green; // Highlight the correct answer
      }
    }
    return Colors.white; // Default color for unanswered buttons
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 32),
        child: BlocConsumer<LearningWordsBloc, LearningWordsState>(
          listener: (context, state) {
            NoWordsWidget(textTheme: textTheme);
          },
          builder: (context, state) {
            if (state is LearningWordsLoading) {
              return NoWordsWidget(textTheme: textTheme);
            } else if (state is LearningWordsSuccess) {
              words = state.words ?? [];
              if (words.isEmpty) {
                return NoWordsWidget(textTheme: textTheme);
              } else {
                // Ensure answers are generated once words are loaded
                if (answers.isEmpty) {
                  generateAnswers();
                }
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
                    CardContainer(
                        textTheme: textTheme,
                        text: state.words?[index].word ?? ''),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 3,
                        children: [
                          for (var answer in answers)
                            WordButton(
                              color: getButtonColor(answer),
                              text: answer,
                              textTheme: textTheme,
                              onTap: () {
                                if (!isAnswerChecked) {
                                  checkAnswer(answer);
                                }
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            } else {
              return NoWordsWidget(textTheme: textTheme);
            }
          },
        ),
      ),
    );
  }
}
