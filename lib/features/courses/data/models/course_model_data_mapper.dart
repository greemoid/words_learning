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

extension CourseModelMapper on Course {
  CourseModelData toCourseModelData() {
    return CourseModelData(
        title: title,
        description: description,
        coverUrl: coverUrl,
        wordsCount: wordsCount);
  }
}
