import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../data/models/client_workout.dart';
import 'training_schedule_card.dart';

class TrainingSchedule extends StatelessWidget {
  final List<ClientWorkout> workouts;

  const TrainingSchedule({super.key, required this.workouts});

  @override
  Widget build(BuildContext context) {
    if (workouts.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'У вас нет тренировок на этот день.',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ),
      );
    }

    return Column(
      children: workouts.map((workout) {
        String time = 'No time specified';
        final DateFormat formatter = DateFormat.Hm();
        time = formatter.format(workout.startDate);
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
