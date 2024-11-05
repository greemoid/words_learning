import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:words_learning/core/error/failure.dart';
import 'package:words_learning/core/usecase/usecase.dart';
import 'package:words_learning/features/courses/domain/course.dart';
import 'package:words_learning/features/courses/domain/usecases/add_course_usecase.dart';
import 'package:words_learning/features/courses/domain/usecases/delete_course_usecase.dart';
import 'package:words_learning/features/courses/domain/usecases/get_all_courses_usecase.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final AddCourseUseCase _addCourseUseCase;
  final DeleteCourseUseCase _deleteCourseUseCase;
  final GetAllCoursesUseCase _getAllCoursesUseCase;

  CourseBloc(
      {required AddCourseUseCase addCourseUseCase,
      required DeleteCourseUseCase deleteCourseUseCase,
      required GetAllCoursesUseCase getAllCoursesUseCase})
      : _addCourseUseCase = addCourseUseCase,
        _deleteCourseUseCase = deleteCourseUseCase,
        _getAllCoursesUseCase = getAllCoursesUseCase,
        super(CourseInitial()) {
    on<CourseEvent>((event, emit) {
      emit(CourseLoading());
    });
    on<GetCoursesEvent>(_onGetCourses);
    on<AddCourseEvent>(_onAddCourse);
    on<DeleteCourseEvent>(_onDeleteCourse);
  }

  StreamSubscription<Either<Failure, List<Course>>>? _coursesSubscription;

  void _onGetCourses(GetCoursesEvent event, Emitter<CourseState> emit) async {
    await emit.forEach(
      _getAllCoursesUseCase(NoParams()),
      // Stream<Either<Failure, List<Course>>>
      onData: (Either<Failure, List<Course>> result) {
        return result.fold(
          (failure) => CourseError(message: failure.message),
          (courses) => CourseLoaded(courses),
        );
      },
      onError: (error, stackTrace) {
        return CourseError(message: error.toString());
      },
    );
  }

  void _onAddCourse(AddCourseEvent event, Emitter<CourseState> emit) async {
    final result = await _addCourseUseCase(event.course);
    result.fold((failure) => emit(CourseError(message: failure.message)),
        (success) => emit(CourseLoaded()));
  }

  void _onDeleteCourse(
      DeleteCourseEvent event, Emitter<CourseState> emit) async {
    final result = await _deleteCourseUseCase(event.course);
    result.fold((failure) => emit(CourseError(message: failure.message)),
        (success) => emit(CourseLoaded()));
  }

  @override
  Future<void> close() {
    _coursesSubscription?.cancel();
    return super.close();
  }
}
