import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/client_workout.dart';
import '../../data/repositories/api_repository.dart';
import 'calendar.dart';
import 'training_schedule.dart';

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

  Future<void> fetchWorkoutsForSelectedDay() async {
    await _fetchWorkouts(selectedDay);
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
          selectedDay: selectedDay,
          focusedDay: selectedDay,
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
