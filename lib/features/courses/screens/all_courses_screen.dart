import 'package:flutter/material.dart';
import 'package:words_learning/common/widgets/light_grey_divider.dart';
import 'package:words_learning/core/theme/color_palette.dart';
import 'package:words_learning/features/courses/widgets/main_course_widget.dart';
import 'package:words_learning/features/courses/widgets/secondary_course_widget.dart';
import 'package:words_learning/features/courses/widgets/streak_widget.dart';

class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorPalette.mainFocusColor,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          'ALL COURSES',
          style: textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ClipOval(
                child: Image.asset('assets/images/default-profile-photo.png')),
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
                      'Master the art of offensive and profane language.'),
              SizedBox(height: 16),
              StreakWidget(textTheme: textTheme),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SecondaryCourseWidget(onTap: () {}, wordsCount: 121, courseTitle: "Top 100 Words of English", textTheme: textTheme),
                  SizedBox(width: 12),
                  SecondaryCourseWidget(onTap: () {}, wordsCount: 21, courseTitle: "Top idioms", textTheme: textTheme),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SecondaryCourseWidget(onTap: () {}, wordsCount: 1013, courseTitle: "The most useful words", textTheme: textTheme),
                  SizedBox(width: 12),
                  SecondaryCourseWidget(onTap: () {}, wordsCount: 11, courseTitle: "Numbers", textTheme: textTheme),
                ],
              ),
              SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}