import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../data/models/client_exercise_set.dart';
import '../../data/models/client_workout_exercise.dart';

class CompletedSetsList extends StatelessWidget {
  final List<ClientWorkoutExercise> completedExercises;

  const CompletedSetsList({
    Key? key,
    required this.completedExercises,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: completedExercises.map((exercise) {
        return _buildExerciseSection(exercise);
      }).toList(),
    );
  }

  Widget _buildExerciseSection(ClientWorkoutExercise exercise) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (exercise.startDate != null)
              Text(
                DateFormat('dd.MM').format(exercise.startDate!),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemPurple,
                ),
              ),
            const SizedBox(height: 8),
            ...exercise.sets.map((set) => _buildSetRow(set)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSetRow(ClientExerciseSet set) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '#${set.order + 1} ${set.restTime} кг x ${set.reps} повторов',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (set.startDate != null)
            Text(
              DateFormat('HH:mm').format(set.startDate!),
              style: const TextStyle(
                fontSize: 16,
                color: CupertinoColors.systemGrey,
              ),
            ),
        ],
      ),
    );
  }
}
