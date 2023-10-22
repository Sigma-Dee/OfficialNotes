import 'package:flutter/material.dart';

import '../model/data_model.dart';

String userName = 'Sigma D';
String userDetail = 'admin';
String userEmail = 'devtee9@gmail.com';
// layout change listener
bool isToggled = false;
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

// list colors

List<Color> listColors = [
  Colors.blue.shade100,
  Colors.green.shade100,
  Colors.brown.shade100,
  Colors.orange.shade100,
];

List<Color> listAccentColors = [
  Colors.blue.shade300,
  Colors.green.shade300,
  Colors.brown.shade300,
  Colors.orange.shade300,
];

// note
List<Note> deletedNotes = [];
List<Note> savedNotes = [];
/*
// task
List<Task> deletedTasks = [];
List<Task> savedTasks = [];
// memo
List<Memo> deletedMemos = [];
List<Memo> savedMemos = [];
// agenda
List<Agenda> deletedAgenda = [];
List<Agenda> savedAgenda = [];


 */
