import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:words_learning/core/database/database.dart';

class Course extends Equatable {
  final int? id;
  final String title;
  final String? description;
  final String? coverUrl;
  final int wordsCount;

  const Course(
      {this.id,
      required this.title,
      this.description,
      this.coverUrl,
      required this.wordsCount});

  CourseModelCompanion toCourse() {
    return CourseModelCompanion(
      id: Value(id ?? 0),
      title: Value(title),
      description: Value(description),
      coverUrl: Value(coverUrl),
      wordsCount: Value(wordsCount),
    );
  }

  @override
  String toString() {
    return 'Course{id: $id, title: $title, description: $description, coverUrl: $coverUrl, wordsCount: $wordsCount}';
  }

  @override
  List<Object?> get props => [id, title, description, coverUrl, wordsCount];
}
