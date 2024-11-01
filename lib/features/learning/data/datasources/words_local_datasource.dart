import 'package:drift/drift.dart';
import 'package:words_learning/core/database/database.dart';

abstract interface class WordsLocalDatasource {
  Future<List<WordModelData>> getAllWords();

  Future<void> addWord(WordModelData word);

  Future<void> addAllWords(List<WordModelData> words);

  Future<void> updateWord(WordModelData word);

  Future<void> deleteWord(WordModelData word);
}

class WordsLocalDataSourceImpl implements WordsLocalDatasource {
  WordsLocalDataSourceImpl({required this.database});

  final AppDatabase database;

  @override
  Future<List<WordModelData>> getAllWords() async {
    try {
      final allWords = await database.select(database.wordModel).get();
      return allWords;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> addAllWords(List<WordModelData> words) async {
    try {
      await database.batch((batch) {
        batch.insertAll(database.wordModel, words,
            mode: InsertMode.insertOrReplace);
      });
    } catch (e) {
      // todo: make catches normally!!!
      print(e.toString());
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
  Future<void> updateWord(WordModelData word) async {
    try {
      await database
          .into(database.wordModel)
          .insert(word, mode: InsertMode.insertOrReplace);
    } catch (e) {
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
