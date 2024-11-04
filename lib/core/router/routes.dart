enum Routes {
  initial('/'),
  profile('/profile'),
  allCourses('/all_courses'),
  myCourses('/my_courses'),
  course('/course'),
  deepLearning('/deep_learning'),
  test('/test'),
  matching('/matching'),
  dragAndDrop('/drag_and_drop'),
  writing('/writing'),
  addCourse('/add_course'),
  addWords('/add_words/:courseId');

  final String path;

  const Routes(this.path);
}
