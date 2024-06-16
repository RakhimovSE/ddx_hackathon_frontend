import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/client_workout.dart';
import '../../data/repositories/api_repository.dart';

class WeeklyTrainingsSection extends StatefulWidget {
  const WeeklyTrainingsSection({super.key});

  @override
  WeeklyTrainingsSectionState createState() => WeeklyTrainingsSectionState();
}

class WeeklyTrainingsSectionState extends State<WeeklyTrainingsSection> {
  List<ClientWorkout> workouts = [];
  DateTime selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _fetchWorkouts(selectedDay);
  }

  Future<void> _fetchWorkouts(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    final String? userJson = prefs.getString('user');
    if (userJson != null) {
      final Map<String, dynamic> userMap = jsonDecode(userJson);
      final int clientId = userMap['ID'];
      if (!mounted) return;
      final apiRepository = context.read<ApiRepository>();

      try {
        final fetchedWorkouts = await apiRepository.fetchClientWorkouts(
          clientId,
          date: date.toIso8601String().split('T')[0],
        );
        if (mounted) {
          setState(() {
            workouts = fetchedWorkouts;
          });
        }
      } catch (e) {
        print("Failed to load workouts: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'План на неделю',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Calendar(
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              this.selectedDay = selectedDay;
            });
            _fetchWorkouts(selectedDay);
          },
        ),
        TrainingSchedule(workouts: workouts),
      ],
    );
  }
}

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

class TrainingSchedule extends StatelessWidget {
  final List<ClientWorkout> workouts;

  const TrainingSchedule({super.key, required this.workouts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: workouts.map((workout) {
        return TrainingScheduleCard(
          title: workout.name,
          time: workout.startDate.toIso8601String(),
          trainer: 'Тренер', // Adjust as necessary
          imageUrl: 'https://example.com/training.jpg', // Placeholder
        );
      }).toList(),
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
