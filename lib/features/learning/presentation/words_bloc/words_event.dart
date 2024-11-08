part of 'words_bloc.dart';

@immutable
sealed class WordsEvent {}

final class AddWordEvent extends WordsEvent {
  AddWordEvent({required this.word});

  final Word word;
}

final class AddAllWordsEvent extends WordsEvent {
  AddAllWordsEvent({required this.words});

  final List<Word> words;
}

final class DeleteWordEvent extends WordsEvent {
  DeleteWordEvent({required this.word});

  final Word word;
}

final class GetAllWordsEvent extends WordsEvent {
  GetAllWordsEvent({required this.courseId});

  final int courseId;
}
