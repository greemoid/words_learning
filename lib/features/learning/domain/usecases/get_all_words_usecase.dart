import 'package:fpdart/fpdart.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/core/usecase/usecase.dart';
import 'package:words_learning/features/learning/domain/word.dart';
import 'package:words_learning/features/learning/domain/words_repository.dart';

class GetAllWordsUseCase implements UseCase<List<Word>, NoParams> {
  GetAllWordsUseCase({required WordsRepository repository}) : _repository = repository;

  final WordsRepository _repository;

  @override
  Future<Either<Failure, List<Word>>> call(NoParams params) async {
    return await _repository.getAllWords();
  }
}