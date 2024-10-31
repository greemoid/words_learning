
import 'package:fpdart/fpdart.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/features/courses/data/datasourses/course_local_datasourse.dart';
import 'package:words_learning/features/courses/data/models/course_model_data_mapper.dart';
import 'package:words_learning/features/courses/domain/course.dart';
import 'package:words_learning/features/courses/domain/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  CourseRepositoryImpl({required this.localDataSource});

  final CourseLocalDataSource localDataSource;

  @override
  Future<Either<Failure, void>> addCourse(Course course) async {
    try {
      await localDataSource.addCourse(course.toCourseModelData());
      return Either.right(null);
    } catch (e) {
      return Either.left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getAllCourses() async {
    try {
      final courses = await localDataSource.getAllCourses();
      List<Course> mappedCourses = [];
      for (var course in courses) {
        mappedCourses.add(course.toCourse());
      }
      return Either.right(mappedCourses);
    } catch (e) {
      return Either.left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse(Course course) async {
    try {
      await localDataSource.deleteCourse(course.toCourseModelData());
      return Either.right(null);
    } catch (e) {
      return Either.left(Failure(e.toString()));
    }
  }
}
