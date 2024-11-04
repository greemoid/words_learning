import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/common/widgets/light_grey_divider.dart';
import 'package:words_learning/core/router/routes.dart';
import 'package:words_learning/features/courses/presentation/widgets/learning_button.dart';
import 'package:words_learning/features/learning/presentation/widgets/word_item.dart';
import 'package:words_learning/features/learning/presentation/words_bloc/words_bloc.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late int courseId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    courseId = GoRouterState.of(context).extra as int;
    context.read<WordsBloc>().add(GetAllWordsEvent(courseId: courseId));
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LEARNING',
          style: textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                context.go(Routes.profile.path);
              },
              child: ClipOval(
                  child:
                      Image.asset('assets/images/default-profile-photo.png')),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LightGreyDivider(),
              SizedBox(height: 16),
              Text('Title of Course', style: textTheme.titleMedium),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LearningButton(
                      onTap: () {
                        context.go(Routes.deepLearning.path);
                      },
                      icon: Icons.sd_card,
                      label: "Learn",
                      textTheme: textTheme),
                  SizedBox(width: 12),
                  LearningButton(
                      onTap: () {
                        context.go(Routes.matching.path);
                      },
                      icon: Icons.sd_card,
                      label: "Top idioms",
                      textTheme: textTheme),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LearningButton(
                      onTap: () {
                        context.go(Routes.writing.path);
                      },
                      icon: Icons.sd_card,
                      label: "Top idioms",
                      textTheme: textTheme),
                  SizedBox(width: 12),
                  LearningButton(
                      onTap: () {
                        context.go(Routes.test.path);
                      },
                      icon: Icons.sd_card,
                      label: "Top idioms",
                      textTheme: textTheme),
                ],
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Words', style: textTheme.titleMedium),
                  IconButton(
                    onPressed: () {
                      context.push(Routes.addWords.path, extra: courseId);
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              BlocConsumer<WordsBloc, WordsState>(
                listener: (context, state) {
                  if (state is WordsError) {
                    print(state.message);
                  }
                },
                builder: (context, state) {
                  if (state is WordsLoading) {
                    return CircularProgressIndicator();
                  }

                  if (state is WordsSuccess) {
                    final wordList = state.words;
                    if (wordList != null && wordList.isNotEmpty) {
                      return ListView.builder(
                          itemCount: wordList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: WordItem(
                                word: wordList[index].word,
                                definition: wordList[index].definition,
                                value: wordList[index].stability,
                                textTheme: textTheme,
                              ),
                            );
                          });
                    }
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                              'There no words, \ntry adding them by pressing on add button.')),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Center(
                        child: Text(
                            textAlign: TextAlign.center,
                            'There no words, \ntry adding them by pressing on add button.')),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class Word {
//   final String word;
//   final String definition;
//   final double value;
//
//   Word({
//     required this.word,
//     required this.definition,
//     required this.value,
//   });
// }

// List<Word> wordList = [
//   Word(
//       word: "abate",
//       definition: "to decrease in force or intensity",
//       value: 0.45),
//   Word(word: "benevolent", definition: "well-meaning and kindly", value: 0.72),
//   Word(
//       word: "candor",
//       definition: "the quality of being open and honest",
//       value: 0.81),
//   Word(
//       word: "debacle",
//       definition: "a sudden and ignominious failure",
//       value: 0.36),
//   Word(
//       word: "elusive",
//       definition: "difficult to find, catch, or achieve",
//       value: 0.63),
//   Word(
//       word: "frugal",
//       definition: "sparing or economical with resources",
//       value: 0.58),
//   Word(
//       word: "gregarious", definition: "fond of company; sociable", value: 0.29),
//   Word(
//       word: "hinder",
//       definition: "to create difficulties, resulting in delay",
//       value: 0.77),
//   Word(
//       word: "indolent",
//       definition: "wanting to avoid activity; lazy",
//       value: 0.52),
//   Word(word: "jovial", definition: "cheerful and friendly", value: 0.90),
//   Word(
//       word: "keen",
//       definition: "having or showing eagerness or enthusiasm",
//       value: 0.69),
//   Word(
//       word: "lucid",
//       definition: "expressed clearly; easy to understand",
//       value: 0.41),
//   Word(
//       word: "meticulous",
//       definition: "showing great attention to detail",
//       value: 0.87),
//   Word(
//       word: "nebulous",
//       definition: "in the form of a cloud; unclear",
//       value: 0.34),
//   Word(
//       word: "obstinate",
//       definition: "stubbornly refusing to change opinion",
//       value: 0.65),
//   Word(
//       word: "placate",
//       definition: "to make someone less angry or hostile",
//       value: 0.76),
//   Word(
//       word: "quandary",
//       definition: "a state of uncertainty over what to do",
//       value: 0.43),
//   Word(
//       word: "resilient",
//       definition: "able to withstand or recover quickly",
//       value: 0.92),
//   Word(
//       word: "savvy",
//       definition: "shrewd and knowledgeable; practical",
//       value: 0.55),
//   Word(
//       word: "tenacious",
//       definition: "tending to keep a firm hold; persistent",
//       value: 0.68),
// ];
