import 'package:get_it/get_it.dart';
import 'package:words_learning/core/database/database.dart';
import 'package:words_learning/features/courses/data/course_repository_impl.dart';
import 'package:words_learning/features/courses/data/datasourses/course_local_datasourse.dart';
import 'package:words_learning/features/courses/domain/course_repository.dart';
import 'package:words_learning/features/courses/domain/usecases/add_course_usecase.dart';
import 'package:words_learning/features/courses/domain/usecases/delete_course_usecase.dart';
import 'package:words_learning/features/courses/domain/usecases/get_all_courses_usecase.dart';
import 'package:words_learning/features/courses/presentation/course_bloc/course_bloc.dart';

part 'init_dependencies_main.dart';
