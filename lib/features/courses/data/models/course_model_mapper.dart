import 'package:words_learning/core/database/database.dart';
import 'package:words_learning/features/courses/domain/course.dart';

extension CourseModelMapper on Course {
  CourseModelData toCourseModelData() {
    return CourseModelData(
        title: title,
        description: description,
        coverUrl: coverUrl,
        wordsCount: wordsCount);
  }
}
