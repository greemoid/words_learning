import 'package:words_learning/core/database/database.dart';
import 'package:words_learning/features/learning/domain/word.dart';

extension WordModelMapper on Word {
  WordModelData toWordModelData() {
    return WordModelData(
      word: word,
      definition: definition,
      courseId: courseId,
      due: due,
      lastReview: lastReview,
      stability: stability,
      difficulty: difficulty,
      elapsedDays: elapsedDays,
      scheduledDays: scheduledDays,
      reps: reps,
      lapses: lapses,
      state: state,
    );
  }
}
