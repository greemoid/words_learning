import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/common/widgets/light_grey_divider.dart';
import 'package:words_learning/core/router/routes.dart';
import 'package:words_learning/core/theme/color_palette.dart';
import 'package:words_learning/features/courses/presentation/course_bloc/course_bloc.dart';
import 'package:words_learning/features/courses/presentation/widgets/main_course_widget.dart';
import 'package:words_learning/features/courses/presentation/widgets/secondary_course_widget.dart';
import 'package:words_learning/features/courses/presentation/widgets/streak_widget.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CourseBloc>().add(GetCoursesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(Routes.addCourse.path);
        },
        backgroundColor: ColorPalette.mainFocusColor,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          'MY COURSES',
          style: textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                context.go(Routes.profile.path);
              },
              child: ClipOval(
                  child:
                      Image.asset('assets/images/default-profile-photo.png')),
            ),
          )
        ],
      ),
      body: BlocConsumer<CourseBloc, CourseState>(
        listener: (context, state) {
          if (state is CourseError) {
            print(state.message);
          }
        },
        builder: (context, state) {
          if (state is CourseLoaded) print(state.courses.toString());
          if (state is CourseLoading) print('loading');

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LightGreyDivider(),
                  SizedBox(height: 16),
                  MainCourseWidget(
                    textTheme: textTheme,
                    courseTitle: 'Swear words',
                    courseDescription:
                        'Master the art of offensive and profane language.',
                    onTap: () {
                      context.go(Routes.course.path);
                    },
                  ),
                  SizedBox(height: 16),
                  StreakWidget(textTheme: textTheme),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SecondaryCourseWidget(
                          onTap: () {},
                          wordsCount: 121,
                          courseTitle: "Top 100 Words of English",
                          textTheme: textTheme),
                      SizedBox(width: 12),
                      SecondaryCourseWidget(
                          onTap: () {},
                          wordsCount: 21,
                          courseTitle: "Top idioms",
                          textTheme: textTheme),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SecondaryCourseWidget(
                          onTap: () {},
                          wordsCount: 1013,
                          courseTitle: "The most useful words",
                          textTheme: textTheme),
                      SizedBox(width: 12),
                      SecondaryCourseWidget(
                          onTap: () {},
                          wordsCount: 11,
                          courseTitle: "Numbers",
                          textTheme: textTheme),
                    ],
                  ),
                  SizedBox(height: 32)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
