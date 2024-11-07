import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/router/routes.dart';
import 'package:words_learning/features/courses/presentation/screens/add_course_screen.dart';
import 'package:words_learning/features/courses/presentation/screens/all_courses_screen.dart';
import 'package:words_learning/features/courses/presentation/screens/my_courses_screen.dart';
import 'package:words_learning/features/learning/presentation/screens/add_words_screen.dart';
import 'package:words_learning/features/learning/presentation/screens/course_screen.dart';
import 'package:words_learning/features/learning/presentation/screens/deep_learning_screen.dart';
import 'package:words_learning/features/learning/presentation/screens/drag_and_drop_screen.dart';
import 'package:words_learning/features/learning/presentation/screens/matching_screen.dart';
import 'package:words_learning/features/learning/presentation/screens/test_screen.dart';
import 'package:words_learning/features/learning/presentation/screens/writing_screen.dart';
import 'package:words_learning/features/profile/screens/profile_screen.dart';

final class RouterManager {
  const RouterManager._();

  static GoRouter get router => _routes;

  static final _routes = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.initial.path,
        builder: (BuildContext context, GoRouterState state) {
          return MyCoursesScreen();
        },
      ),
      GoRoute(
        path: Routes.profile.path,
        builder: (BuildContext context, GoRouterState state) {
          return ProfileScreen();
        },
      ),
      GoRoute(
        path: Routes.allCourses.path,
        builder: (BuildContext context, GoRouterState state) {
          return AllCoursesScreen();
        },
      ),
      GoRoute(
        path: Routes.myCourses.path,
        builder: (BuildContext context, GoRouterState state) {
          return MyCoursesScreen();
        },
      ),
      GoRoute(
        path: Routes.course.path,
        builder: (BuildContext context, GoRouterState state) {
          return CourseScreen();
        },
      ),
      GoRoute(
        path: Routes.deepLearning.path,
        builder: (BuildContext context, GoRouterState state) {
          return DeepLearningScreen();
        },
      ),
      GoRoute(
        path: Routes.test.path,
        builder: (BuildContext context, GoRouterState state) {
          return TestScreen();
        },
      ),
      GoRoute(
        path: Routes.matching.path,
        builder: (BuildContext context, GoRouterState state) {
          return MatchingScreen();
        },
      ),
      GoRoute(
        path: Routes.dragAndDrop.path,
        builder: (BuildContext context, GoRouterState state) {
          return DragAndDropScreen();
        },
      ),
      GoRoute(
        path: Routes.writing.path,
        builder: (BuildContext context, GoRouterState state) {
          return WritingScreen();
        },
      ),
      GoRoute(
        path: Routes.addCourse.path,
        builder: (BuildContext context, GoRouterState state) {
          return AddCourseScreen();
        },
      ),
      GoRoute(
          path: Routes.addWords.path,
          builder: (BuildContext context, GoRouterState state) {
            // final courseId = int.parse(state.pathParameters['courseId']!);
            return AddWordsScreen();
          }),
    ],
  );
}
