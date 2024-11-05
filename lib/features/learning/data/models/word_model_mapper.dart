import 'package:words_learning/core/database/database.dart';
import 'package:words_learning/features/learning/domain/word.dart';

extension WordModelMapper on Word {
  WordModelData toWordModelData() {
    return WordModelData(
      word: word,
      definition: definition,
      courseId: courseId,
      due: card.due,
      lastReview: card.lastReview,
      stability: card.stability,
      difficulty: card.difficulty,
      elapsedDays: card.elapsedDays,
      scheduledDays: card.scheduledDays,
      reps: card.reps,
      lapses: card.lapses,
      state: card.state.val,
    );
  }
}
