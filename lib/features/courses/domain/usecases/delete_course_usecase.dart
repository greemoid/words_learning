import 'package:fpdart/src/either.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/core/usecase/usecase.dart';
import 'package:words_learning/features/courses/domain/course.dart';
import 'package:words_learning/features/courses/domain/course_repository.dart';

class DeleteCourseUseCase implements UseCase<void, Course> {
  DeleteCourseUseCase({required this.repository});

  final CourseRepository repository;

  @override
  Future<Either<Failure, void>> call(Course params) async {
    return await repository.deleteCourse(params);
  }
}
