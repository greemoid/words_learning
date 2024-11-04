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
          // context.go('/add_words/123');
          // context.go(Routes.addCourse.path);
          context.push(Routes.addCourse.path);
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
      body: Padding(
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
              BlocConsumer<CourseBloc, CourseState>(
                listener: (context, state) {
                  if (state is CourseError) {
                    print(state.message);
                  }
                },
                builder: (context, state) {
                  if (state is CourseLoading) {
                    return CircularProgressIndicator();
                  }

                  if (state is CourseLoaded) {
                    print(state.courses.toString());
                    if (state.courses != null) {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12,
                                  crossAxisCount: 2),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.courses?.length,
                          itemBuilder: (context, index) {
                            final course = state.courses?[index];

                            return SecondaryCourseWidget(
                                onTap: () {
                                  context.push(Routes.course.path,
                                      extra: course.id);
                                },
                                wordsCount: course!.wordsCount,
                                courseTitle: course.title,
                                textTheme: textTheme);
                          });
                    } else {
                      return Center(
                        child: Text(
                            "There no courses. Please move to \"All Courses screen\""),
                      );
                    }
                  }

                  return SizedBox();
                },
              ),
              SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}
