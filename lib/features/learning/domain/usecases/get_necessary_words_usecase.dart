import 'package:fpdart/src/either.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/core/usecase/usecase.dart';
import 'package:words_learning/features/learning/domain/word.dart';
import 'package:words_learning/features/learning/domain/words_repository.dart';

class GetNecessaryWordsUseCase
    implements StreamUseCase<List<Word>, NecessaryWordsParams> {
  GetNecessaryWordsUseCase({required WordsRepository repository})
      : _repository = repository;

  final WordsRepository _repository;

  @override
  Stream<Either<Failure, List<Word>>> call(NecessaryWordsParams params) {
    return _repository.getNecessaryWords(params.courseId, params.limit);
  }
}

class NecessaryWordsParams {
  NecessaryWordsParams({required this.courseId, required this.limit});

  final int courseId;
  final int limit;
}
