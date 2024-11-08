import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/features/learning/domain/usecases/get_necessary_words_usecase.dart';
import 'package:words_learning/features/learning/domain/usecases/update_word_usecase.dart';
import 'package:words_learning/features/learning/domain/word.dart';

part 'learning_words_event.dart';
part 'learning_words_state.dart';

class LearningWordsBloc extends Bloc<LearningWordsEvent, LearningWordsState> {
  final UpdateWordUseCase _updateWordUseCase;
  final GetNecessaryWordsUseCase _getNecessaryWordsUseCase;

  LearningWordsBloc({
    required UpdateWordUseCase updateWordsUseCase,
    required GetNecessaryWordsUseCase getNecessaryWordsUseCase,
  })  : _updateWordUseCase = updateWordsUseCase,
        _getNecessaryWordsUseCase = getNecessaryWordsUseCase,
        super(LearningWordsInitial()) {
    on<LearningWordsEvent>((event, emit) {
      emit(LearningWordsLoading());
    });
    on<UpdateLearningWordEvent>(_updateWords);
    on<GetLearningWordsEvent>(_getLearningWords);
  }

  StreamSubscription<Either<Failure, List<Word>>>? _streamSubscription;

  void _updateWords(
      UpdateLearningWordEvent event, Emitter<LearningWordsState> emit) async {
    final result = await _updateWordUseCase(event.word);
    result.fold((failure) => emit(LearningWordsError(message: failure.message)),
        (success) => emit(LearningWordsSuccess()));
  }

  void _getLearningWords(
      GetLearningWordsEvent event, Emitter<LearningWordsState> emit) async {
    await emit.forEach(
        _getNecessaryWordsUseCase(
            NecessaryWordsParams(courseId: event.courseId, limit: event.limit)),
        onData: (Either<Failure, List<Word>> result) {
      return result.fold(
        (failure) => LearningWordsError(message: failure.message),
        (words) {
          print(words);
          return LearningWordsSuccess(words);
        },
      );
    }, onError: (error, stackTrace) {
      return LearningWordsError(message: error.toString());
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
