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
    required this.taskTitle,
    required this.taskDetails,
    required this.taskCreatedAt,
    required this.isChecked,
    required this.isDeleted,
  });
  @HiveField(0)
  String taskTitle;
  @HiveField(1)
  String? taskDetails;
  @HiveField(2)
  DateTime taskCreatedAt;
  @HiveField(3)
  bool isChecked = false;
  @HiveField(4)
  bool isDeleted = false;
}
/*
@HiveType(typeId: 2)
class Memo {}

@HiveType(typeId: 3)
class Agenda {}


 */
