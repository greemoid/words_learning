import 'package:fsrs/fsrs.dart';
import 'package:words_learning/core/database/database.dart';
import 'package:words_learning/features/learning/domain/word.dart';

extension WordModelDataMapper on WordModelData {
  Word toWord() {
    return Word(
      id: id,
      word: word,
      definition: definition,
      courseId: courseId,
      card: Card().copyWith(
        due: due,
        lastReview: lastReview,
        stability: stability,
        difficulty: difficulty,
        elapsedDays: elapsedDays,
        scheduledDays: scheduledDays,
        reps: reps,
        lapses: lapses,
        state: State.newState,
      ),
    );
  }
}
