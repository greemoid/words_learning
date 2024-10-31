import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_learning/core/common/widgets/black_button.dart';
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
      print('Course Name: $_courseTitle');
      print('Course Description: $_courseDescription');
      context.read<CourseBloc>().add(AddCourseEvent(
          course: Course(
              title: _courseTitle,
              description: _courseDescription,
              wordsCount: 0)));
      final bloc = context.read<CourseBloc>().state;
      print(bloc.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Course Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a course name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _courseTitle = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Course Description',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a course description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _courseDescription = value!;
                },
              ),
              SizedBox(height: 24.0),
              BlackButton(
                  textButton: 'SAVE',
                  onTap: () {
                    _addCourse();
                  },
                  textTheme: Theme.of(context).textTheme)
              // RaisedButton(
              //   onPressed: _addCourse,
              //   child: Text('Add Course'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
