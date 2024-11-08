import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_learning/core/di/init_dependencies.dart';
import 'package:words_learning/features/courses/presentation/course_bloc/course_bloc.dart';
import 'package:words_learning/features/learning/presentation/learning_words_bloc/learning_words_bloc.dart';
import 'package:words_learning/features/learning/presentation/words_bloc/words_bloc.dart';

class CustomMultiBlocProvider extends StatelessWidget {
  final Widget child;

  const CustomMultiBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => serviceLocator<CourseBloc>()),
      BlocProvider(create: (_) => serviceLocator<WordsBloc>()),
      BlocProvider(create: (_) => serviceLocator<LearningWordsBloc>()),
    ], child: child);
  }
}
