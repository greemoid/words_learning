import 'package:fpdart/src/either.dart';
import 'package:words_learning/core/database/database.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/features/learning/data/datasources/words_local_datasource.dart';
import 'package:words_learning/features/learning/data/models/word_model_data_mapper.dart';
import 'package:words_learning/features/learning/data/models/word_model_mapper.dart';
import 'package:words_learning/features/learning/domain/word.dart';
import 'package:words_learning/features/learning/domain/words_repository.dart';

class WordsRepositoryImpl implements WordsRepository {
  WordsRepositoryImpl({required this.localDatasource});

  final WordsLocalDatasource localDatasource;

  @override
  Future<Either<Failure, List<Word>>> getAllWords() async {
    try {
      final allWords = await localDatasource.getAllWords();
      List<Word> mappedWords = [];
      for (var word in allWords) {
        mappedWords.add(word.toWord());
      }
      return Either.right(mappedWords);
    } catch (e) {
      return Either.left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addAllWords(List<Word> words) async {
    try {
      List<WordModelData> mappedWords = [];
      for (final word in words) {
        mappedWords.add(word.toWordModelData());
        print(mappedWords);
      }
      await localDatasource.addAllWords(mappedWords);
      return Either.right(null);
    } catch (e) {
      return Either.left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addWord(Word word) async {
    try {
      await localDatasource.addWord(word.toWordModelData());
      return Either.right(null);
    } catch (e) {
      return Either.left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteWord(Word word) async {
    try {
      await localDatasource.deleteWord(word.toWordModelData());
      return Either.right(null);
    } catch (e) {
      return Either.left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateWord(Word word) async {
    try {
      await localDatasource.updateWord(word.toWordModelData());
      return Either.right(null);
    } catch (e) {
      return Either.left(Failure(e.toString()));
    }
  }
}
