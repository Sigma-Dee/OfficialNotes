import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:official_app/main.dart';
import 'package:official_app/model/data_model.dart';

import '../data/handler.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({
    super.key,
    required this.updateUI,
    this.stateCheck,
    this.taskKey,
    required this.initialTitle,
    required this.initialDetails,
    required this.initialDate,
  });

  final VoidCallback updateUI;
  final String? stateCheck;
  final String initialTitle;
  final String initialDetails;
  final String? taskKey;
  final String initialDate;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  // Text Editing Controllers
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  // Edit Mode Trigger
  late bool isEditMode;
  String? bVal;
  // Initialize State
  @override
  void initState() {
    dateTime = DateTime.now();
    // String to Boolean value
    bVal = widget.stateCheck?.toString();
    if (bVal == 'true') {
      isEditMode = true;
    } else {
      isEditMode = false;
    }
    // Text Editor Controllers
    if (isEditMode == true) {
      titleController.text = widget.initialTitle;
      contentController.text = widget.initialDetails;
      if (widget.initialDate.isNotEmpty) {
        String initialDateTime = widget.initialDate;
        DateTime dateTime =
            DateFormat('E, MMM d, h:mm a').parse(initialDateTime);
        dateData = DateFormat('E, MMM d').format(dateTime);
        timeData = DateFormat('h:mm a').format(dateTime);
      } else {
        return;
      }
    } else {
      return;
    }
    super.initState();
  }

  void clear() {
    titleController.clear();
    contentController.clear();
    dateData = '';
    timeData = '';
  }

  void onCancel() {
    Navigator.pop(context);
    clear();
  }

  Color hardColor = Colors.green.shade300;
  Color softColor = Colors.green.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onCancel,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: hardColor,
          ),
        ),
        title: Text(
          isEditMode ? 'Edit Task' : 'Create Task',
          style: TextStyle(
            color: hardColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                if (dateData.isNotEmpty && timeData.isNotEmpty) {
                  combinedDateTime = '$dateData, $timeData';
                }
                setState(() {
                  taskBox.put(
                    widget.taskKey ?? 'key_${titleController.text}',
                    Task(
                      isChecked: false,
                      taskTitle: titleController.text,
                      taskDetails: contentController.text,
                      taskDate: combinedDateTime,
                      isDeleted: false,
                      taskCreatedAt: today,
                    ),
                  );
                });

                Navigator.pop(context);

                clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text(isEditMode ? 'Task Changes Saved' : 'Task Saved'),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: ShapeDecoration(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: softColor.withOpacity(0.2),
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.inbox_rounded,
                  color: hardColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(28),
          ),
          child: Container(
            height: 400,
            padding: const EdgeInsets.all(10),
            color: softColor,
            child: Center(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            TextField(
                              controller: contentController,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  bottom: 5,
                                  top: 12,
                                  left: 10,
                                  right: 10,
                                ),
                                hintText: 'Description',
                                hintStyle: TextStyle(
                                  color: hardColor,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                            buildDateTimeSection(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: titleController,
                    onChanged: null,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                      hintText: 'Task',
                      hintStyle: TextStyle(
                        color: hardColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool addDate = false;
  bool addTime = false;

  Widget buildDateTimeSection() {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              focusColor: hardColor,
              activeColor: hardColor,
              side: BorderSide(
                width: 2,
                color: hardColor,
              ),
              value: addDate,
              onChanged: (_) {
                setState(() {
                  addDate = !addDate;
                });
              },
            ),
            Text(
              'DATE',
              style: TextStyle(
                color: hardColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        addDate ? buildDateWidget() : const SizedBox(),
        Row(
          children: [
            Checkbox(
              focusColor: hardColor,
              activeColor: hardColor,
              side: BorderSide(
                width: 2,
                color: hardColor,
              ),
              value: addTime,
              onChanged: (_) {
                setState(() {
                  addTime = !addTime;
                });
              },
            ),
            Text(
              'TIME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: hardColor,
              ),
            ),
          ],
        ),
        addTime ? buildTimeWidget() : const SizedBox(),
      ],
    );
  }

  Widget buildDateWidget() {
    String pickedDate = Utils.toDate(dateTime);
    return Container(
      decoration: ShapeDecoration(
        color: softColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      width: 180,
      child: dropDown(
        text: pickedDate,
        onClick: () => datePicker(
          completedDate: Utils.toDate(dateTime),
          pickDate: true,
        ),
        color: hardColor,
      ),
    );
  }

  Widget buildTimeWidget() {
    String pickedTime = Utils.toTime(dateTime);
    return Container(
      decoration: ShapeDecoration(
        color: softColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      width: 160,
      child: dropDown(
        text: pickedTime,
        onClick: () => timePicker(
          completedTime: Utils.toTime(dateTime),
          pickTime: true,
        ),
        color: hardColor,
      ),
    );
  }

  datePicker({
    required bool pickDate,
    required String completedDate,
  }) async {
    final date = await chooseDate(
      dateTime,
      pickDate: pickDate,
      firstDate: pickDate ? today : null,
      completedDate: completedDate,
    );

    if (date == null) return;

    setState(() => dateTime = date);
  }

  timePicker({
    required bool pickTime,
    required String completedTime,
  }) async {
    final date = await chooseTime(
      dateTime,
      pickTime: pickTime,
      firstDate: pickTime ? today : null,
      completedTime: completedTime,
    );

    if (date == null) return;

    setState(() => dateTime = date);
  }

  Future<DateTime?> chooseDate(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
    required String completedDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? today,
        lastDate: DateTime(2030),
      ).whenComplete(() => dateData = completedDate);

      if (date == null) return null;

      final time = Duration(
        hours: initialDate.hour,
        minutes: initialDate.minute,
      );

      return date.add(time);
    }
    return null;
  }

  Future<DateTime?> chooseTime(
    DateTime initialDate, {
    required bool pickTime,
    DateTime? firstDate,
    required String completedTime,
  }) async {
    if (pickTime) {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      ).whenComplete(() => timeData = completedTime);

      if (timeOfDay == null) return null;

      final date = DateTime(
        initialDate.year,
        initialDate.month,
        initialDate.day,
      );

      final time = Duration(
        hours: timeOfDay.hour,
        minutes: timeOfDay.minute,
      );

      return date.add(time);
    }
    return null;
  }

  Widget dropDown({
    required String text,
    required VoidCallback onClick,
    required Color color,
  }) =>
      ListTile(
        title: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          Icons.arrow_drop_down,
          color: color,
        ),
        onTap: onClick,
      );
}
