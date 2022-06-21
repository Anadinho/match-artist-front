import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

var now = DateTime.now();
var firstDay = DateTime(now.year, now.month - 3, now.day);
var lastDay = DateTime(now.year, now.month + 3, now.day);

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: now,
          firstDay: firstDay,
          lastDay: lastDay,
          calendarFormat: format,
          availableCalendarFormats: const {
            CalendarFormat.month: 'mes',
            CalendarFormat.week: 'semana',
            CalendarFormat.twoWeeks: '2 semanas'
          },
          headerStyle: HeaderStyle(titleCentered: true),
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            // selectedDecoration: const BoxDecoration(
            //   color: Colors.blueGrey,
            //   shape: BoxShape.rectangle,
            // ),
          ),
        )
      ],
    );
  }
}
