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

final class GetNecessaryWordsEvent extends WordsEvent {
  GetNecessaryWordsEvent({required this.courseId, this.limit = 5});

  final int courseId;
  final int limit;
}

final class UpdateWordsEvent extends WordsEvent {
  UpdateWordsEvent({required this.words});

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
