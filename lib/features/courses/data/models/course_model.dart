import 'package:drift/drift.dart';

class CourseModel extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();

  TextColumn get title => text().withLength(min: 1, max: 255)();

  TextColumn get description => text().nullable()();

  TextColumn get coverUrl => text().nullable()();

  IntColumn get wordsCount => integer()();
}
