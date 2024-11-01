import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_learning/features/learning/domain/word.dart';
import 'package:words_learning/features/learning/presentation/words_bloc/words_bloc.dart';

class AddWordsScreen extends StatefulWidget {
  const AddWordsScreen({super.key, required this.courseId});

  final int courseId;

  @override
  State<AddWordsScreen> createState() => _AddWordsScreenState();
}

class _AddWordsScreenState extends State<AddWordsScreen> {
  final List<Word> _words = [];

  void _addField() {
    setState(() {
      _words.add(Word(
        word: '',
        definition: '',
        courseId: widget.courseId,
        due: DateTime.now(),
        lastReview: DateTime.now(),
        stability: 0,
        difficulty: 0,
        elapsedDays: 0,
        scheduledDays: 0,
        reps: 0,
        lapses: 0,
        state: 0,
      ));
    });
  }

  void _updateWord(int index, {String? word, String? definition}) {
    final updatedWord = _words[index].copyWith(
      word: word ?? _words[index].word,
      definition: definition ?? _words[index].definition,
    );
    setState(() {
      _words[index] = updatedWord;
    });
  }

  void _saveToDatabase() {
    // Додаємо подію в BLoC для збереження слів у базу даних
    context.read<WordsBloc>().add(AddAllWordsEvent(words: _words));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Words"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveToDatabase,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _words.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: "Title"),
                          initialValue: _words[index].word,
                          onChanged: (value) {
                            _updateWord(index, word: value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a title";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.0),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Definition"),
                          initialValue: _words[index].definition,
                          onChanged: (value) {
                            _updateWord(index, definition: value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a definition";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addField,
            ),
          ],
        ),
      ),
    );
  }
}
