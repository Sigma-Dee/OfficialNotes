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
    final timeFormat = DateFormat('h:mm a');
    final time = timeFormat.format(dateTime);

    return '$time';
  }

  static DateTime removeTime(DateTime dateTime) => DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
      );
}

String userName = 'User Name';
String userDetail = 'co-worker';
String userEmail = 'user@email.com';

// icon list
List<IconData> buttonIcons = [
  Icons.add,
  Icons.add_task,
  Icons.calendar_month_rounded,
  Icons.info_outline_rounded,
];

// text list
List<String> buttonText = [
  'Note',
  'Task',
  'Agenda',
  'Issues',
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
