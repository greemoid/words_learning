import 'package:drift/drift.dart';
import 'package:words_learning/core/database/database.dart';

abstract interface class WordsLocalDatasource {
  Stream<List<WordModelData>> getAllWords(int courseId);

  Future<void> addWord(WordModelData word);

  Future<void> addAllWords(List<WordModelData> words);

  Future<void> updateWords(List<WordModelData> words);

  Future<void> deleteWord(WordModelData word);

// todo: потрібно буде додати гетВордсФоКурс і там
// використовувати https://drift.simonbinder.eu/dart_api/select/#limit
// + https://drift.simonbinder.eu/dart_api/select/#where
// для того, щоб підбирати потрібні слова в кількості заданій в налаштуваннях курсу
}

class WordsLocalDataSourceImpl implements WordsLocalDatasource {
  WordsLocalDataSourceImpl({required this.database});

  final AppDatabase database;

  @override
  Stream<List<WordModelData>> getAllWords(int courseId) {
    final filteredWords = database.select(database.wordModel)
      ..where((model) => model.courseId.equals(courseId));

    return filteredWords.watch();
  }

  @override
  Future<void> addAllWords(List<WordModelData> words) async {
    try {
      await database.batch((batch) {
        batch.insertAllOnConflictUpdate(database.wordModel, words);
      });
    } catch (e) {
      // todo: make catches normally!!!
      throw Exception(e);
    }
  }

  @override
  Future<void> addWord(WordModelData word) async {
    try {
      await database
          .into(database.wordModel)
          .insert(word, mode: InsertMode.insertOrReplace);
    } catch (e) {
      throw Exception(e);
    }
  }

  // todo: change if needed. if no, make one fun upsertWord()
  @override
  Future<void> updateWords(List<WordModelData> words) async {
    try {
      for (var word in words) {
        database.update(database.wordModel).replace(word);
      }
    } catch (e) {
      print('UPDATE: $e');
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteWord(WordModelData word) async {
    try {
      await database.delete(database.wordModel).delete(word);
    } catch (e) {
      throw Exception(e);
    }
  }
}
