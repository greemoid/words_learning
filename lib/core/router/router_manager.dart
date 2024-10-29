import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/router/routes.dart';
import 'package:words_learning/features/learning/screens/drag_and_drop_screen.dart';

final class RouterManager {
  const RouterManager._();

  static GoRouter get router => _routes;

  static final _routes = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.initial.path,
        builder: (BuildContext context, GoRouterState state) {
          return DragAndDropScreen();
        },
      ),
    ],
  );
}
