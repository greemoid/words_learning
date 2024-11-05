import 'package:drift/drift.dart';
import 'package:words_learning/core/database/database.dart';

abstract interface class CourseLocalDataSource {
  Future<void> addCourse(CourseModelData course);

  Stream<List<CourseModelData>> getAllCourses();

  Future<void> deleteCourse(CourseModelData course);
}

class CourseLocalDataSourceImpl implements CourseLocalDataSource {
  final AppDatabase database;

  CourseLocalDataSourceImpl({required this.database});

  @override
  Future<void> addCourse(CourseModelData course) async {
    try {
      print(course.toString());
      await database
          .into(database.courseModel)
          .insert(course, mode: InsertMode.insertOrReplace);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteCourse(CourseModelData course) async {
    try {
      await database.delete(database.courseModel).delete(course);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<List<CourseModelData>> getAllCourses() {
    return database.select(database.courseModel).watch();
  }
}
