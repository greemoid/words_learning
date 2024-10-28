import 'package:flutter/material.dart';
import 'package:words_learning/core/router/router_manager.dart';
import 'package:words_learning/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterManager.router,
      title: 'World Learning',
      theme: WordsTheme.lightThemeMode
    );
  }
}

