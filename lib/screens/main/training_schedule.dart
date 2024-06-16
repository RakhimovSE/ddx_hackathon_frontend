import 'package:flutter/cupertino.dart';
import '../../data/models/client_workout.dart';
import 'training_schedule_card.dart';

class TrainingSchedule extends StatelessWidget {
  final List<ClientWorkout> workouts;

  const TrainingSchedule({super.key, required this.workouts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: workouts.map((workout) {
        return TrainingScheduleCard(
          title: workout.name,
          time: workout.startDate?.toIso8601String() ?? 'No time specified',
          trainer: 'Тренер', // Adjust as necessary
          imageUrl: 'https://example.com/training.jpg', // Placeholder
        );
      }).toList(),
    );
  }
}
