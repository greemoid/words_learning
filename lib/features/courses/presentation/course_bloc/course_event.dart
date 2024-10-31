part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

final class GetCoursesEvent extends CourseEvent {}

final class AddCourseEvent extends CourseEvent {
  AddCourseEvent({required this.course});

  final Course course;
}

final class DeleteCourseEvent extends CourseEvent {
  DeleteCourseEvent({required this.course});

  final Course course;
}
