import 'package:fpdart/fpdart.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/features/learning/domain/word.dart';

abstract interface class WordsRepository {
  Future<Either<Failure, List<Word>>> getAllWords();

  Future<Either<Failure, void>> addWord(Word word);

  Future<Either<Failure, void>> updateWord(Word word);

  // Will be used for quizlet soon https://drift.simonbinder.eu/dart_api/writes/#inserts
  Future<Either<Failure, void>> addAllWords(List<Word> words);

  Future<Either<Failure, void>> deleteWord(Word word);

  // Soon
  // Future<Either<Failure, void>> deleteAllWords(List<Word> words);

}