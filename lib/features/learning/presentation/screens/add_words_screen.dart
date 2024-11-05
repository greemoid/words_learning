import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsrs/fsrs.dart' as f;
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/common/widgets/light_grey_divider.dart';
import 'package:words_learning/core/common/widgets/rectangle_icon_button.dart';
import 'package:words_learning/features/learning/domain/word.dart';
import 'package:words_learning/features/learning/presentation/words_bloc/words_bloc.dart';

class AddWordsScreen extends StatefulWidget {
  const AddWordsScreen({super.key});

  @override
  State<AddWordsScreen> createState() => _AddWordsScreenState();
}

class _AddWordsScreenState extends State<AddWordsScreen> {
  final List<Word> _words = [];
  late int courseId;
  late Word mockedWord;
  final List<GlobalKey<FormState>> _formKeys = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    courseId = GoRouterState.of(context).extra as int;
    mockedWord =
        Word(word: '', definition: '', courseId: courseId, card: f.Card()
            // due: DateTime.now(),
            // lastReview: DateTime.now(),
            // stability: 0,
            // difficulty: 0,
            // elapsedDays: 0,
            // scheduledDays: 0,
            // reps: 0,
            // lapses: 0,
            // state: 0,
            );
    _words.add(mockedWord);
    _formKeys.add(GlobalKey<FormState>()); // Initialize the first form key
  }

  void _addField() {
    setState(() {
      _words.add(mockedWord);
      _formKeys
          .add(GlobalKey<FormState>()); // Add a new form key for the new word
    });
  }

  void _updateWord(int index, {String? word, String? definition}) {
    final updatedWord = _words[index].copyWith(
      courseId: courseId,
      word: word ?? _words[index].word,
      definition: definition ?? _words[index].definition,
    );
    setState(() {
      _words[index] = updatedWord;
    });
  }

  void _saveToDatabase() {
    bool allValid = true;

    // Validate all forms
    for (var key in _formKeys) {
      if (!key.currentState!.validate()) {
        allValid = false;
      }
    }

    if (allValid) {
      // Save form values
      for (int i = 0; i < _words.length; i++) {
        _formKeys[i].currentState!.save();
      }
      context.read<WordsBloc>().add(AddAllWordsEvent(words: _words));
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0).copyWith(top: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RectangleIconButton(
                    icon: Icons.close_rounded,
                    onTap: () {
                      context.pop();
                    }),
                RectangleIconButton(
                    icon: Icons.done_rounded,
                    onTap: () {
                      _saveToDatabase();
                    }),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _words.length,
                itemBuilder: (context, index) {
                  return Form(
                    key: _formKeys[index],
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: TextFormField(
                            onSaved: (value) {
                              _words[index] = _words[index].copyWith(
                                word: value ?? '',
                              );
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a word';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            autofocus: true,
                            maxLines: 1,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 12),
                              hintText: 'Word',
                              hintStyle: textTheme.bodyMedium,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: TextFormField(
                            onSaved: (value) {
                              _words[index] = _words[index].copyWith(
                                definition: value ?? '',
                              );
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a definition';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            autofocus: true,
                            maxLines: 1,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 12),
                              hintText: 'Definition',
                              hintStyle: textTheme.bodyMedium,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: LightGreyDivider(),
                  );
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.add_rounded, size: 32, color: Colors.black),
              onPressed: _addField,
            ),
          ],
        ),
      ),
    );
  }
}
