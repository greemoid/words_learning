import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/features/learning/domain/usecases/add_all_words_usecase.dart';
import 'package:words_learning/features/learning/domain/usecases/add_word_usecase.dart';
import 'package:words_learning/features/learning/domain/usecases/delete_word_usecase.dart';
import 'package:words_learning/features/learning/domain/usecases/get_all_words_usecase.dart';
import 'package:words_learning/features/learning/domain/usecases/update_word_usecase.dart';
import 'package:words_learning/features/learning/domain/word.dart';

part 'words_event.dart';
part 'words_state.dart';

class WordsBloc extends Bloc<WordsEvent, WordsState> {
  final GetAllWordsUseCase _getAllWordsUseCase;
  final AddWordUseCase _addWordUseCase;
  final DeleteWordUseCase _deleteWordUseCase;
  final UpdateWordsUseCase _updatesWordUseCase;
  final AddAllWordsUseCase _addAllWordsUseCase;

  WordsBloc({
    required GetAllWordsUseCase getAllWordsUseCase,
    required AddWordUseCase addWordUseCase,
    required DeleteWordUseCase deleteWordUseCase,
    required UpdateWordsUseCase updateWordsUseCase,
    required AddAllWordsUseCase addAllWordsUseCase,
  })  : _getAllWordsUseCase = getAllWordsUseCase,
        _addWordUseCase = addWordUseCase,
        _deleteWordUseCase = deleteWordUseCase,
        _updatesWordUseCase = updateWordsUseCase,
        _addAllWordsUseCase = addAllWordsUseCase,
        super(WordsInitial()) {
    on<WordsEvent>((event, emit) {
      emit(WordsLoading());
    });
    on<GetAllWordsEvent>(_getAllWords);
    on<AddAllWordsEvent>(_addAllWords);
    on<AddWordEvent>(_addWord);
    on<DeleteWordEvent>(_deleteWord);
    on<UpdateWordsEvent>(_updateWords);
  }

  StreamSubscription<Either<Failure, List<Word>>>? _streamSubscription;

  void _getAllWords(GetAllWordsEvent event, Emitter<WordsState> emit) async {
    await emit.forEach(_getAllWordsUseCase(event.courseId),
        onData: (Either<Failure, List<Word>> result) {
      return result.fold(
        (failure) => WordsError(message: failure.message),
        (words) => WordsSuccess(words),
      );
    }, onError: (error, stackTrace) {
      return WordsError(message: error.toString());
    });
  }

  void _addAllWords(AddAllWordsEvent event, Emitter<WordsState> emit) async {
    final result = await _addAllWordsUseCase(event.words);
    result.fold((failure) => emit(WordsError(message: failure.message)),
        (success) => emit(WordsSuccess()));
  }

  void _addWord(AddWordEvent event, Emitter<WordsState> emit) async {
    final result = await _addWordUseCase(event.word);
    result.fold((failure) => emit(WordsError(message: failure.message)),
        (success) => emit(WordsSuccess()));
  }

  void _deleteWord(DeleteWordEvent event, Emitter<WordsState> emit) async {
    final result = await _deleteWordUseCase(event.word);
    result.fold((failure) => emit(WordsError(message: failure.message)),
        (success) => emit(WordsSuccess()));
  }

  void _updateWords(UpdateWordsEvent event, Emitter<WordsState> emit) async {
    final result = await _updatesWordUseCase(event.words);
    result.fold((failure) => emit(WordsError(message: failure.message)),
        (success) => emit(WordsSuccess()));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
