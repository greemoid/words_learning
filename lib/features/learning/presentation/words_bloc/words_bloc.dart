import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final UpdateWordUseCase _updateWordUseCase;
  final AddAllWordsUseCase _addAllWordsUseCase;

  WordsBloc({
    required GetAllWordsUseCase getAllWordsUseCase,
    required AddWordUseCase addWordUseCase,
    required DeleteWordUseCase deleteWordUseCase,
    required UpdateWordUseCase updateWordUseCase,
    required AddAllWordsUseCase addAllWordsUseCase,
  })  : _getAllWordsUseCase = getAllWordsUseCase,
        _addWordUseCase = addWordUseCase,
        _deleteWordUseCase = deleteWordUseCase,
        _updateWordUseCase = updateWordUseCase,
        _addAllWordsUseCase = addAllWordsUseCase,
        super(WordsInitial()) {
    on<WordsEvent>((event, emit) {
      emit(WordsLoading());
    });
    on<GetAllWordsEvent>(_getAllWords);
    on<AddAllWordsEvent>(_addAllWords);
    on<AddWordEvent>(_addWord);
    on<DeleteWordEvent>(_deleteWord);
    on<UpdateWordEvent>(_updateWord);
  }

  void _getAllWords(GetAllWordsEvent event, Emitter<WordsState> emit) async {
    final result = await _getAllWordsUseCase(event.courseId);
    result.fold((l) => emit(WordsError(message: l.message)),
        (r) => emit(WordsSuccess(r)));
  }

  void _addAllWords(AddAllWordsEvent event, Emitter<WordsState> emit) async {
    final result = await _addAllWordsUseCase(event.words);
    result.fold((l) => emit(WordsError(message: l.message)),
        (r) => emit(WordsSuccess()));
  }

  void _addWord(AddWordEvent event, Emitter<WordsState> emit) async {
    final result = await _addWordUseCase(event.word);
    result.fold((l) => emit(WordsError(message: l.message)),
        (r) => emit(WordsSuccess()));
  }

  void _deleteWord(DeleteWordEvent event, Emitter<WordsState> emit) async {
    final result = await _deleteWordUseCase(event.word);
    result.fold((l) => emit(WordsError(message: l.message)),
        (r) => emit(WordsSuccess()));
  }

  void _updateWord(UpdateWordEvent event, Emitter<WordsState> emit) async {
    final result = await _updateWordUseCase(event.word);
    result.fold((l) => emit(WordsError(message: l.message)),
        (r) => emit(WordsSuccess()));
  }
}
