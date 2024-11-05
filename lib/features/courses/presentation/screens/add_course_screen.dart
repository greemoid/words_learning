import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:words_learning/core/common/widgets/rectangle_icon_button.dart';
import 'package:words_learning/features/courses/domain/course.dart';
import 'package:words_learning/features/courses/presentation/course_bloc/course_bloc.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({super.key});

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  String _courseTitle = '';
  String _courseDescription = '';

  void _addCourse() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<CourseBloc>().add(AddCourseEvent(
          course: Course(
              title: _courseTitle,
              description: _courseDescription,
              wordsCount: 0)));
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0).copyWith(top: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RectangleIconButton(
                    icon: Icons.close_rounded,
                    onTap: () {
                      context.pop();
                    }),
                RectangleIconButton(
                    icon: Icons.done_rounded,
                    onTap: () {
                      _addCourse();
                    }),
              ],
            ),
            SizedBox(height: 28),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    child: TextFormField(
                      onSaved: (value) {
                        _courseTitle = value ?? '';
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a course name';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      autofocus: true,
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        hintText: 'Course title',
                        hintStyle: textTheme.bodyMedium,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 176,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    child: TextFormField(
                      onSaved: (value) {
                        _courseDescription = value ?? '';
                      },
                      cursorColor: Colors.black,
                      autofocus: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        hintText: 'Course description',
                        hintStyle: textTheme.bodyMedium,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  // BlackButton(
                  //     textButton: 'SAVE',
                  //     onTap: () {
                  //       _addCourse();
                  //     },
                  //     textTheme: Theme.of(context).textTheme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
