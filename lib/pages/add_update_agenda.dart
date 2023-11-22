import 'package:flutter/material.dart';

import '../data/handler.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({
    super.key,
    this.updateUI,
    this.stateCheck,
  });

  final VoidCallback? updateUI;
  final String? stateCheck;
  //final String initialTitle;
  //final String initialContent;
  //final String? noteKey;

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  // Text Editing Controllers
  var subjectController = TextEditingController();
  var contentController = TextEditingController();
  // Initialize State
  @override
  void initState() {
    super.initState();
  }

  // dispose
  @override
  void dispose() {
    subjectController.dispose();
    contentController.dispose();
    super.dispose();
  }

  Color hardColor = Colors.orange.shade300;
  Color softColor = Colors.orange.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: hardColor,
          ),
        ),
        title: Text(
          'Create Agenda',
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
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Saved'),
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
                        height: 350,
                        child: SingleChildScrollView(
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
                      ),
                    ],
                  ),
                  TextField(
                    controller: subjectController,
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
                      hintText: 'Subject',
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

  bool isAllDay = false;

  Widget buildDateTimeSection() {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    bottom: 5,
                  ),
                  child: Text(
                    'START DATE & TIME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                buildDateWidget(),
                SizedBox(
                  height: 5,
                ),
                buildTimeWidget(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    bottom: 5,
                  ),
                  child: Text(
                    'END DATE & TIME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                buildDateWidget(),
                SizedBox(
                  height: 5,
                ),
                buildTimeWidget(),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Checkbox(
                      focusColor: hardColor,
                      activeColor: hardColor,
                      side: BorderSide(
                        width: 2,
                        color: hardColor,
                      ),
                      value: isAllDay,
                      onChanged: (_) {
                        setState(() {
                          isAllDay = !isAllDay;
                        });
                      },
                    ),
                    Text(
                      'All Day',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: hardColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
      width: 165,
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
      width: 165,
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
}
