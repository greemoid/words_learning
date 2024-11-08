part of 'learning_words_bloc.dart';

@immutable
sealed class LearningWordsState {}

final class LearningWordsInitial extends LearningWordsState {}

final class LearningWordsSuccess extends LearningWordsState {
  LearningWordsSuccess([this.words]);

  final List<Word>? words;
}

final class LearningWordsError extends LearningWordsState {
  LearningWordsError({required this.message});

  final String message;
}

final class LearningWordsLoading extends LearningWordsState {}
