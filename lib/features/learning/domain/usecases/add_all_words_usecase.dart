import 'package:fpdart/src/either.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/core/usecase/usecase.dart';
import 'package:words_learning/features/learning/domain/word.dart';
import 'package:words_learning/features/learning/domain/words_repository.dart';

class AddAllWordsUseCase implements UseCase<void, List<Word>> {
  AddAllWordsUseCase({required this.repository});

  final WordsRepository repository;

  @override
  Future<Either<Failure, void>> call(List<Word> params) async {
    return await repository.addAllWords(params);
  }
}
