import 'package:words_learning/core/database/database.dart';
import 'package:words_learning/features/courses/domain/course.dart';

extension CourseModelDataMapper on CourseModelData {
  Course toCourse() {
    return Course(
        id: id,
        title: title,
        description: description,
        coverUrl: coverUrl,
        wordsCount: wordsCount);
  }
}

