import 'package:drift/drift.dart';
import 'package:words_learning/features/courses/data/models/course_model.dart';

class WordModel extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();

  TextColumn get word => text().withLength(min: 0, max: 255)();

  TextColumn get definition => text().withLength(min: 0, max: 255)();

  IntColumn get courseId => integer().references(CourseModel, #id)();

  TextColumn get mediaUrl => text().nullable()();

  DateTimeColumn get due => dateTime()();

  DateTimeColumn get lastReview => dateTime()();

  RealColumn get stability => real().withDefault(Constant(0.0))();

  RealColumn get difficulty => real().withDefault(Constant(0.0))();

  IntColumn get elapsedDays => integer().withDefault(Constant(0))();

  IntColumn get scheduledDays => integer().withDefault(Constant(0))();

  IntColumn get reps => integer().withDefault(Constant(0))();

  IntColumn get lapses => integer().withDefault(Constant(0))();

  IntColumn get state => integer().withDefault(Constant(0))();
}
