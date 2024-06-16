import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../data/models/client_workout.dart';
import 'training_schedule_card.dart';

class TrainingSchedule extends StatelessWidget {
  final List<ClientWorkout> workouts;

  const TrainingSchedule({super.key, required this.workouts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: workouts.map((workout) {
        String time = 'No time specified';
        if (workout.startDate != null) {
          final DateFormat formatter = DateFormat.Hm();
          time = formatter.format(workout.startDate!);
        }
        return TrainingScheduleCard(
          title: workout.name,
          time: time,
          trainer: 'Тренер', // Adjust as necessary
          imageUrl: 'https://example.com/training.jpg', // Placeholder
        );
      }).toList(),
    );
  }
}
