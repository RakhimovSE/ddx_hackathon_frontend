import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../data/models/client_workout_exercise.dart';

class CompletedSetsList extends StatelessWidget {
  final List<ClientWorkoutExercise> completedExercises;

  const CompletedSetsList({super.key, required this.completedExercises});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: completedExercises
          .map((exercise) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                      Text(
                        exercise.exercise.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        exerciseSetsDescription(exercise),
                        style: const TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${DateFormat('dd MMMM', 'ru').format(exercise.startDate ?? DateTime.now())} ${DateFormat('HH:mm').format(exercise.startDate ?? DateTime.now())}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }

  String exerciseSetsDescription(ClientWorkoutExercise exercise) {
    return exercise.sets.map((set) {
      if (set.duration > 0) {
        return '${set.duration} сек';
      } else {
        return '${set.reps} раз';
      }
    }).join(', ');
  }
}
