import 'package:flutter/material.dart';
import 'package:official_app/main.dart';
import 'package:official_app/model/data_model.dart';
import 'package:official_app/pages/add_update_task.dart';
import 'package:provider/provider.dart';

import '../../components/main_body.dart';
import '../../constants/time.dart';
import '../../data/handler.dart';

class AllTasksPage extends StatefulWidget {
  const AllTasksPage({super.key});

  @override
  State<AllTasksPage> createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  // check list
  bool isListEmpty() {
    if (taskBox.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color hardColor = Colors.green.shade300;
    Color softColor = Colors.green.shade100;
    return Scaffold(
      body: isListEmpty()
          ? Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(28),
                ),
                child: Container(
                  color: softColor,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        color: Colors.white,
                        child: Text(
                          'Add New Task',
                          style: TextStyle(
                            color: hardColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : SwitchTaskLayout(
              hardColor: hardColor,
              softColor: softColor,
              updateUI: updateUI,
            ),
    );
  }
}

class SwitchTaskLayout extends StatefulWidget {
  const SwitchTaskLayout({
    super.key,
    required this.hardColor,
    required this.softColor,
    required this.updateUI,
  });

  final Color hardColor;
  final Color softColor;
  final VoidCallback updateUI;

  @override
  State<SwitchTaskLayout> createState() => _SwitchTaskLayoutState();
}

class _SwitchTaskLayoutState extends State<SwitchTaskLayout> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<LayoutChangerState>();
    if (appState.isToggled == true) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(28),
        ),
        child: Container(
          color: widget.softColor,
          child: Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                color: Colors.white,
                child: Text(
                  'Grid View',
                  style: TextStyle(
                    color: widget.hardColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: taskBox.length,
        itemBuilder: (context, index) {
          Task taskData = taskBox.getAt(index);
          String taskKey = taskBox.keyAt(index);
          final createdAt = taskData.taskCreatedAt;
          final formattedTime = formatTimeDifference(createdAt);
          return Card(
            clipBehavior: Clip.hardEdge,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TaskPage(
                      updateUI: widget.updateUI,
                      initialTitle: taskData.taskTitle,
                      initialDetails: taskData.taskDetails,
                      stateCheck: 'true',
                      taskKey: taskKey,
                      initialDate: taskData.taskDate,
                    ),
                  ),
                );
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) => CustomTaskDialogWidget(
                    titleText: taskData.taskTitle,
                    detailsText: taskData.taskDetails,
                    dateText: taskData.taskDate,
                    isChecked: taskData.isChecked,
                    createdAt: formattedTime,
                    index: index,
                    taskData: taskData,
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TaskTile(
                    taskName: taskData.taskTitle,
                    taskCompleted: taskData.isChecked,
                    onChanged: (index) {
                      setState(() {
                        taskData.isChecked = !taskData.isChecked;
                      });
                    },
                    date: taskData.taskDate,
                    description: taskData.taskDetails,
                    hardColor: widget.hardColor,
                    softColor: widget.softColor,
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}

class TaskTile extends StatelessWidget {
  TaskTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.date,
    required this.description,
    required this.hardColor,
    required this.softColor,
  });
  final Color hardColor;
  final Color softColor;
  final String taskName;
  final String description;
  final String date;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
            focusColor: hardColor,
            activeColor: hardColor,
            side: BorderSide(
              width: 2,
              color: hardColor,
            ),
            value: taskCompleted,
            onChanged: onChanged,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              description.isEmpty
                  ? const SizedBox()
                  : Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
              const SizedBox(
                height: 5,
              ),
              dateBubble(),
            ],
          ),
        ],
      ),
    );
  }

  Widget dateBubble() {
    if (date.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: softColor,
        ),
        child: Text(date),
      );
    } else {
      return const SizedBox();
    }
  }
}

class CustomTaskDialogWidget extends StatefulWidget {
  CustomTaskDialogWidget({
    required this.taskData,
    required this.titleText,
    required this.detailsText,
    required this.dateText,
    required this.isChecked,
    required this.createdAt,
    required this.index,
  });

  final Task taskData;
  final String titleText;
  final String detailsText;
  final String dateText;
  final String createdAt;
  final bool isChecked;
  final int index;

  @override
  State<CustomTaskDialogWidget> createState() => _CustomTaskDialogWidgetState();
}

class _CustomTaskDialogWidgetState extends State<CustomTaskDialogWidget> {
  late bool isCompleted;
  String? bVal;

  @override
  void initState() {
    bVal = widget.isChecked.toString();
    if (bVal == 'true') {
      isCompleted = true;
    } else {
      isCompleted = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color cardColor = Colors.green.shade100;
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: 30,
                  ),
                  Text(
                    'Delete Task?',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Card(
              color: cardColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title: ${widget.titleText}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        height: 1.5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Content: ${widget.detailsText}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Date: ${widget.dateText}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      isCompleted ? 'Status: Completed' : 'Status: Incomplete',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Task discarded = taskBox.getAt(widget.index);

                  bool dIsChecked = discarded.isChecked;
                  String dTitle = discarded.taskTitle;
                  String dDetails = discarded.taskDetails;
                  String dStamp = discarded.taskDate;
                  DateTime dDate = discarded.taskCreatedAt;

                  setState(() {
                    if (deletedTasks.contains(discarded)) {
                      return;
                    } else {
                      deletedTasks.add(discarded);
                      taskBox.deleteAt(widget.index);
                    }

                    if (completedTasks.contains(discarded)) {
                      completedTasks.remove(discarded);
                    } else {
                      return;
                    }

                    widget.taskData.isDeleted = !widget.taskData.isDeleted;
                  });

                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Task Deleted'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          setState(() {
                            if (deletedTasks.contains(discarded)) {
                              taskBox.put(
                                'key_$dTitle',
                                Task(
                                  isChecked: dIsChecked,
                                  taskTitle: dTitle,
                                  taskDetails: dDetails,
                                  taskDate: dStamp,
                                  isDeleted: false,
                                  taskCreatedAt: dDate,
                                ),
                              );

                              deletedTasks.remove(discarded);
                            } else {
                              return;
                            }

                            widget.taskData.isDeleted =
                                !widget.taskData.isDeleted;
                          });
                        },
                      ),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                ),
                child: const Text('Delete'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
