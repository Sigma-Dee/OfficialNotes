import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime today = DateTime.now();

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Selected Day = ${today.toString().split(" ")[0]}',
            ),
            Container(
              child: TableCalendar(
                locale: 'en_US',
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                focusedDay: today,
                firstDay: DateTime.utc(1998, 09, 09),
                lastDay: DateTime.utc(2030, 9, 9),
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: onDaySelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
