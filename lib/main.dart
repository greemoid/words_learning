import 'package:flutter/material.dart';
import 'package:words_learning/core/bloc/custom_multi_bloc_provider.dart';
import 'package:words_learning/core/di/init_dependencies.dart';
import 'package:words_learning/core/router/router_manager.dart';
import 'package:words_learning/core/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  // final database = AppDatabase();
  //
  // final CourseLocalDataSource source =
  //     CourseLocalDataSourceImpl(database: database);
  // source.addCourse(CourseModelCompanion(
  //     title: Value('Top 10 words'),
  //     description: Value<String>('Description of a course.'),
  //     coverUrl: Value<String>('https://google.com'),
  //     wordsCount: Value(120)));
  // // await database.into(database.courseModel).insert(
  // //     CourseModelCompanion.insert(
  // //         id: Value<int>(2),
  // //         title: 'Top 10 words',
  // //         description: Value<String>('Description of a course.'),
  // //         coverUrl: Value<String>('https://google.com'),
  // //         wordsCount: 120),
  // //     mode: InsertMode.insertOrReplace);
  // // await database.delete(database.courseModel).delete(
  // //       CourseModelData(id: 1, title: 'Top 1000 words', wordsCount: 120),
  // //     );
  // List<CourseModelData> allItems =
  //     await database.select(database.courseModel).get();
  // //
  // // List<Course> items = [];
  // // allItems.forEach((e) => items.add(e.toCourse()));
  // //
  // print('items in database: $allItems');
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
