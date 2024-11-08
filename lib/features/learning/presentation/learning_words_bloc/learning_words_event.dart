part of 'learning_words_bloc.dart';

@immutable
sealed class LearningWordsEvent {}

final class UpdateLearningWordEvent extends LearningWordsEvent {
  UpdateLearningWordEvent({required this.word});

  final Word word;
}

final class GetLearningWordsEvent extends LearningWordsEvent {
  final int courseId;
  final int limit;

  GetLearningWordsEvent({required this.courseId, this.limit = 5});
}
