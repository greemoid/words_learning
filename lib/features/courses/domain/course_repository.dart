import 'package:fpdart/fpdart.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/features/courses/domain/course.dart';

abstract interface class CourseRepository {
  Future<Either<Failure, void>> addCourse(Course course);

  Future<Either<Failure, List<Course>>> getAllCourses();

  Future<Either<Failure, void>> deleteCourse(Course course);
}
