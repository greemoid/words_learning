import 'package:fpdart/src/either.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/core/usecase/usecase.dart';
import 'package:words_learning/features/courses/domain/course.dart';
import 'package:words_learning/features/courses/domain/course_repository.dart';

class GetAllCoursesUseCase implements UseCase<List<Course>, NoParams> {
  GetAllCoursesUseCase({required this.repository});

  final CourseRepository repository;

  @override
  Future<Either<Failure, List<Course>>> call(NoParams params) async {
    return await repository.getAllCourses();
  }
}
