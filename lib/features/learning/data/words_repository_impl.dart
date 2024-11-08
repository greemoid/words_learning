import 'dart:async';

import 'package:async/async.dart' show StreamZip, StreamGroup;
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
  Stream<Either<Failure, List<Word>>> getAllWords(int courseId) async* {
    try {
      final allWords = localDatasource.getAllWords(courseId);
      await for (var words in allWords) {
        List<Word> mappedWords = words.map((word) => word.toWord()).toList();
        yield Either.right(mappedWords);
      }
    } catch (e) {
      yield Either.left(Failure(e.toString()));
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

  @override
  Stream<Either<Failure, List<Word>>> getNecessaryWords(
      int courseId, int limit) async* {
    try {
      final newStateWords =
          localDatasource.getNewStateWords(courseId, limit).asBroadcastStream();
      final necessaryWords =
          localDatasource.getNecessaryWords(courseId).asBroadcastStream();


      List<Word> mappedWords = [];
      final combinedStream = StreamGroup.merge([newStateWords, necessaryWords])
          .asBroadcastStream();

      await for (var item in combinedStream) {
        mappedWords.addAll(item.map((word) => word.toWord()).toList());
        yield Either.right(mappedWords);
      }
    } catch (e) {
      print(e.toString());
      yield Either.left(Failure(e.toString()));
    }
  }
}
