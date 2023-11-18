import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/data_model.dart';

class Utils {
  static String toDateTime(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    final time = DateFormat.Hm().format(dateTime);

    return '$date $time';
  }

  static String toDate(DateTime dateTime) {
    final date = DateFormat.MMMEd().format(dateTime);

    return '$date';
  }

  static String toTime(DateTime dateTime) {
    final timeFormate = DateFormat('h:mm a');
    final time = timeFormate.format(dateTime);

    return '$time';
  }

  static DateTime removeTime(DateTime dateTime) => DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
      );
}

String userName = 'Sigma D';
String userDetail = 'admin';
String userEmail = 'devtee9@gmail.com';

// icon list
List<IconData> buttonIcons = [
  Icons.add,
  Icons.add_task,
  Icons.add_photo_alternate_outlined,
  Icons.calendar_month_rounded,
];

// text list
List<String> buttonText = [
  'Note',
  'Task',
  'Memo',
  'Agenda',
];

// note
List<Note> deletedNotes = [];
List<Note> savedNotes = [];

// task
List<Task> deletedTasks = [];
List<Task> completedTasks = [];
DateTime dateTime = today;
final DateTime today = DateTime.now();
String combinedDateTime = '';
String dateData = '';
String timeData = '';
/*
// memo
List<Memo> deletedMemos = [];
List<Memo> savedMemos = [];
// agenda
List<Agenda> deletedAgenda = [];
List<Agenda> savedAgenda = [];


 */
