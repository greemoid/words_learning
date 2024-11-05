import 'package:fpdart/fpdart.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/core/usecase/usecase.dart';
import 'package:words_learning/features/learning/domain/word.dart';
import 'package:words_learning/features/learning/domain/words_repository.dart';

class GetAllWordsUseCase implements StreamUseCase<List<Word>, int> {
  GetAllWordsUseCase({required WordsRepository repository})
      : _repository = repository;

  final WordsRepository _repository;

  @override
  Stream<Either<Failure, List<Word>>> call(int courseId) {
    return _repository.getAllWords(courseId);
  }
}
