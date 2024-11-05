import 'package:equatable/equatable.dart';
import 'package:fsrs/fsrs.dart';

class Word extends Equatable {
  final int? id;
  final String word;
  final String definition;
  final int courseId;
  final String? mediaUrl;
  final Card card;

  // final DateTime due;
  // final DateTime lastReview;
  // final double stability;
  // final double difficulty;
  // final int elapsedDays;
  // final int scheduledDays;
  // final int reps;
  // final int lapses;
  // final int state;

  const Word({
    this.id,
    required this.word,
    required this.definition,
    required this.courseId,
    this.mediaUrl,
    required this.card,
  });

  Word copyWith({
    int? id,
    String? word,
    String? definition,
    int? courseId,
    String? mediaUrl,
    Card? card,
    // DateTime? due,
    // DateTime? lastReview,
    // double? stability,
    // double? difficulty,
    // int? elapsedDays,
    // int? scheduledDays,
    // int? reps,
    // int? lapses,
    // int? state,
  }) {
    return Word(
      id: id ?? this.id,
      word: word ?? this.word,
      definition: definition ?? this.definition,
      courseId: courseId ?? this.courseId,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      card: card ?? this.card,
    );
  }

  @override
  List<Object?> get props => [id, word, definition, courseId, mediaUrl, card];
}
