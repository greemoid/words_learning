import 'package:words_learning/core/database/database.dart';
import 'package:words_learning/features/learning/domain/word.dart';

extension WordModelMapper on Word {
  WordModelData toWordModelData() {
    return WordModelData(
      id: id,
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

extension WordModelListMapper on List<Word> {
  List<WordModelData> toWordModelDataList() {
    List<WordModelData> words = [];
    for (var word in this) {
      words.add(word.toWordModelData());
    }
    return words;
  }
}
