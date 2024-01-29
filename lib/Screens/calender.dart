import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then the day will be highlighted.
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            calendarStyle: CalendarStyle(
              todayTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              selectedTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2),
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Add other calendar-related UI components or widgets below
        ],
      ),
    );
  }
}
