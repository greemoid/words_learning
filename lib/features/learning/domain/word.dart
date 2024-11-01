import 'package:equatable/equatable.dart';

class Word extends Equatable {
  final int? id;
  final String word;
  final String definition;
  final int courseId;
  final String? mediaUrl;
  final DateTime due;
  final DateTime lastReview;
  final double stability;
  final double difficulty;
  final int elapsedDays;
  final int scheduledDays;
  final int reps;
  final int lapses;
  final int state;

  const Word({
    this.id,
    required this.word,
    required this.definition,
    required this.courseId,
    this.mediaUrl,
    required this.due,
    required this.lastReview,
    required this.stability,
    required this.difficulty,
    required this.elapsedDays,
    required this.scheduledDays,
    required this.reps,
    required this.lapses,
    required this.state,
  });

  Word copyWith({
    int? id,
    String? word,
    String? definition,
    int? courseId,
    String? mediaUrl,
    DateTime? due,
    DateTime? lastReview,
    double? stability,
    double? difficulty,
    int? elapsedDays,
    int? scheduledDays,
    int? reps,
    int? lapses,
    int? state,
  }) {
    return Word(
      id: id ?? this.id,
      word: word ?? this.word,
      definition: definition ?? this.definition,
      courseId: courseId ?? this.courseId,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      due: due ?? this.due,
      lastReview: lastReview ?? this.lastReview,
      stability: stability ?? this.stability,
      difficulty: difficulty ?? this.difficulty,
      elapsedDays: elapsedDays ?? this.elapsedDays,
      scheduledDays: scheduledDays ?? this.scheduledDays,
      reps: reps ?? this.reps,
      lapses: lapses ?? this.lapses,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [
        id,
        word,
        definition,
        courseId,
        mediaUrl,
        due,
        lastReview,
        stability,
        difficulty,
        elapsedDays,
        scheduledDays,
        reps,
        lapses,
        state,
      ];
}
