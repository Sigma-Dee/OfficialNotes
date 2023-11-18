import 'package:hive/hive.dart';

part 'data_model.g.dart';
// dart run build_runner build

@HiveType(typeId: 0)
class Note {
  Note({
    required this.noteTitle,
    required this.noteContent,
    required this.noteCreatedAt,
    required this.isSaved,
    required this.isDeleted,
  });
  @HiveField(0)
  String noteTitle;
  @HiveField(1)
  String noteContent;
  @HiveField(2)
  DateTime noteCreatedAt;
  @HiveField(3)
  bool isSaved = false;
  @HiveField(4)
  bool isDeleted = false;
}

@HiveType(typeId: 1)
class Task {
  Task({
    required this.isChecked,
    required this.taskTitle,
    required this.taskDetails,
    required this.taskDate,
    required this.isDeleted,
    required this.taskCreatedAt,
  });
  @HiveField(0)
  bool isChecked;
  @HiveField(1)
  String taskTitle;
  @HiveField(2)
  String taskDetails;
  @HiveField(3)
  String taskDate;
  @HiveField(4)
  bool isDeleted = false;
  @HiveField(5)
  DateTime taskCreatedAt;
}

/*
@HiveType(typeId: 2)
class Memo {}

@HiveType(typeId: 3)
class Agenda {}


 */
