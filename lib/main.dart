import 'package:flutter/material.dart';
import 'package:words_learning/core/bloc/custom_multi_bloc_provider.dart';
import 'package:words_learning/core/di/init_dependencies.dart';
import 'package:words_learning/core/router/router_manager.dart';
import 'package:words_learning/core/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(CustomMultiBlocProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: RouterManager.router,
        title: 'World Learning',
        theme: WordsTheme.lightThemeMode);
  }
}
