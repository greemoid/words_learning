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
  final List<TextEditingController> _wordControllers = [];
  final List<TextEditingController> _definitionControllers = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    courseId = GoRouterState.of(context).extra as int;
    mockedWord =
        Word(word: '', definition: '', courseId: courseId, card: f.Card());

    if (_words.isEmpty) {
      _words.add(mockedWord);
      _wordControllers.add(TextEditingController());
      _definitionControllers.add(TextEditingController());
    }

    context.read<WordsBloc>().add(GetAllWordsEvent(courseId: courseId));
  }

  void _addField() {
    setState(() {
      _words.add(mockedWord);
      _wordControllers.add(TextEditingController());
      _definitionControllers.add(TextEditingController());
    });
  }

  void _saveToDatabase() {
    for (int i = 0; i < _words.length; i++) {
      if (_words[i].word == '' && _words[i].definition == '') {
        _words.removeAt(i);
      }
    }

    if (_words.isNotEmpty) {
      context.read<WordsBloc>().add(AddAllWordsEvent(words: _words));
    }
    context.pop();
  }

  @override
  void dispose() {
    for (var controller in _wordControllers) {
      controller.dispose();
    }
    for (var controller in _definitionControllers) {
      controller.dispose();
    }
    super.dispose();
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
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        child: TextFormField(
                          controller: _wordControllers[index],
                          onChanged: (value) {
                            _words[index] = _words[index].copyWith(
                              word: value,
                            );
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
                          controller: _definitionControllers[index],
                          onChanged: (value) {
                            _words[index] = _words[index].copyWith(
                              definition: value,
                            );
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
