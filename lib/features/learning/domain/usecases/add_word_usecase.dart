import 'package:fpdart/src/either.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/core/usecase/usecase.dart';
import 'package:words_learning/features/learning/domain/word.dart';
import 'package:words_learning/features/learning/domain/words_repository.dart';

class AddWordUseCase implements UseCase<void, Word> {
  AddWordUseCase({required WordsRepository repository}) : _repository = repository;

  final WordsRepository _repository;

  @override
  Future<Either<Failure, void>> call(Word params) async {
    return await _repository.addWord(params);
  }
}
