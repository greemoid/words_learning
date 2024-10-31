part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseLoaded extends CourseState {
  CourseLoaded([this.courses]);

  final List<Course>? courses;
}

final class CourseEmpty extends CourseState {}

final class CourseError extends CourseState {
  CourseError({required this.message});

  final String message;
}
