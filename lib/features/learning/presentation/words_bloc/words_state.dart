part of 'words_bloc.dart';

@immutable
sealed class WordsState {}

final class WordsInitial extends WordsState {}

final class WordsLoading extends WordsState {}

final class WordsSuccess extends WordsState {
  WordsSuccess([this.words]);

  final List<Word>? words;
}

final class WordsError extends WordsState {
  WordsError({required this.message});

  final String message;
}
