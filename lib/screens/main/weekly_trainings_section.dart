import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyTrainingsSection extends StatelessWidget {
  const WeeklyTrainingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'План на неделю',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Calendar(),
        TrainingSchedule(),
      ],
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({super.key});

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
        onDaySelected: (selectedDay, focusedDay) {
          // handle day selection
        },
      ),
    );
  }
}

class TrainingSchedule extends StatelessWidget {
  const TrainingSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TrainingScheduleCard(
          title: 'Ноги + плечи',
          time: '14:30 Тренировка #4',
          trainer: 'Алина Колебанова',
          imageUrl: 'https://example.com/training3.jpg',
        ),
        TrainingScheduleCard(
          title: 'Йога вводное',
          time: 'Тренировка #2',
          trainer: null,
          imageUrl: 'https://example.com/training4.jpg',
        ),
      ],
    );
  }
}

class TrainingScheduleCard extends StatelessWidget {
  final String title;
  final String time;
  final String? trainer;
  final String imageUrl;

  const TrainingScheduleCard({
    required this.title,
    required this.time,
    this.trainer,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time,
                    style: const TextStyle(
                        fontSize: 16, color: CupertinoColors.systemGrey)),
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                if (trainer != null)
                  Text(trainer!,
                      style: const TextStyle(
                          fontSize: 16, color: CupertinoColors.activeBlue)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
