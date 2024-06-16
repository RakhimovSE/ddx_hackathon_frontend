import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final Function(DateTime, DateTime) onDaySelected;

  const Calendar({super.key, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: DateTime.now(),
        calendarStyle: const CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: CupertinoColors.systemPurple,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: CupertinoColors.systemBlue,
            shape: BoxShape.circle,
          ),
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onDaySelected: onDaySelected,
      ),
    );
  }
}
