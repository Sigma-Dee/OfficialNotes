import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime today = DateTime.now();
  CalendarView calendarView = CalendarView.week;

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          today.toString().split(" ")[0],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    switch (calendarView) {
                      case CalendarView.schedule:
                        calendarView = CalendarView.schedule;
                        break;
                      case CalendarView.day:
                        calendarView = CalendarView.day;
                        break;
                      case CalendarView.timelineDay:
                        calendarView = CalendarView.timelineDay;
                        break;
                      case CalendarView.week:
                        calendarView = CalendarView.week;
                        break;
                      case CalendarView.timelineWeek:
                        calendarView = CalendarView.timelineWeek;
                        break;
                      case CalendarView.workWeek:
                        calendarView = CalendarView.workWeek;
                        break;
                      case CalendarView.timelineWorkWeek:
                        calendarView = CalendarView.timelineWorkWeek;
                        break;
                      case CalendarView.month:
                        calendarView = CalendarView.month;
                        break;
                      case CalendarView.timelineMonth:
                        calendarView = CalendarView.timelineMonth;
                        break;
                    }
                  });
                },
                child: Text(buttonLabel(calendarView)),
              ),
            ],
          ),
          Expanded(
            child: SfCalendar(
              view: calendarView,
              initialSelectedDate: today,
            ),
          ),
        ],
      ),
    );
  }

  String buttonLabel(CalendarView view) {
    switch (view) {
      case CalendarView.schedule:
        return 'Schedule View';
      case CalendarView.day:
        return 'Day View';
      case CalendarView.timelineDay:
        return 'Day Timeline View';
      case CalendarView.week:
        return 'Week View';
      case CalendarView.timelineWeek:
        return 'Week Timeline View';
      case CalendarView.workWeek:
        return 'Work Week View';
      case CalendarView.timelineWorkWeek:
        return 'Work Week Timeline View';
      case CalendarView.month:
        return 'Month View';
      case CalendarView.timelineMonth:
        return 'Month Timeline View';
    }
  }
}

int index = 0;

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
