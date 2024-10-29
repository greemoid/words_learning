import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/router/routes.dart';
import 'package:words_learning/features/courses/screens/all_courses_screen.dart';
import 'package:words_learning/features/courses/screens/course_screen.dart';
import 'package:words_learning/features/learning/screens/deep_learning_screen.dart';
import 'package:words_learning/features/learning/screens/drag_and_drop_screen.dart';
import 'package:words_learning/features/learning/screens/test_screen.dart';
import 'package:words_learning/features/profile/screens/profile_screen.dart';

final class RouterManager {
  const RouterManager._();

  static GoRouter get router => _routes;

  static final _routes = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.initial.path,
        builder: (BuildContext context, GoRouterState state) {
          return const DragAndDropScreen();
        },
      ),
    ],
  );
}
