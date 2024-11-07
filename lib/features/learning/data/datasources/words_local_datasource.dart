import 'package:drift/drift.dart';
import 'package:fsrs/fsrs.dart';
import 'package:words_learning/core/database/database.dart';

abstract interface class WordsLocalDatasource {
  Stream<List<WordModelData>> getAllWords(int courseId);

  Future<void> addWord(WordModelData word);

  Future<void> addAllWords(List<WordModelData> words);

  Future<void> updateWords(List<WordModelData> words);

  Future<void> deleteWord(WordModelData word);

  Stream<List<WordModelData>> getNewStateWords(int courseId, [int limit = 5]);

  Stream<List<WordModelData>> getNecessaryWords(int courseId);

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
        batch.insertAll(database.wordModel, words, mode: InsertMode.insertOrIgnore);
      });
    } catch (e) {
      // todo: make catches normally!!!
      print('ERROR LOCAL DATASOURCE         $e');
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

  @override
  Stream<List<WordModelData>> getNecessaryWords(int courseId) {
    final filteredWords = database.select(database.wordModel)
      ..where(
        (model) => Expression.and(
          [
            model.due.isSmallerThan(Variable(DateTime.now())),
            model.state.equals(State.newState.val).not(),
            model.courseId.equals(courseId),
          ],
        ),
      );
    print(filteredWords.watch());
    return filteredWords.watch();
  }

  @override
  Stream<List<WordModelData>> getNewStateWords(int courseId, [int limit = 5]) {
    final filteredWords = database.select(database.wordModel)
      ..limit(limit)
      ..where((model) => Expression.and([
            model.state.equals(State.newState.val),
            model.courseId.equals(courseId),
          ]));

    return filteredWords.watch();
  }
}
