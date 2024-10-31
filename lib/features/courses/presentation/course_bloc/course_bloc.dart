import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void _onGetCourses(GetCoursesEvent event, Emitter<CourseState> emit) async {
    final result = await _getAllCoursesUseCase(NoParams());
    result.fold((l) => emit(CourseError(message: l.message)),
        (r) => emit(CourseLoaded(r)));
  }

  void _onAddCourse(AddCourseEvent event, Emitter<CourseState> emit) async {
    final result = await _addCourseUseCase(event.course);
    result.fold((l) => emit(CourseError(message: l.message)),
        (r) => emit(CourseLoaded()));
  }

  void _onDeleteCourse(
      DeleteCourseEvent event, Emitter<CourseState> emit) async {
    final result = await _deleteCourseUseCase(event.course);
    result.fold((l) => emit(CourseError(message: l.message)),
        (r) => emit(CourseLoaded()));
  }
}
