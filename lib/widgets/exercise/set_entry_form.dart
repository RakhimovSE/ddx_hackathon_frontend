import 'package:flutter/cupertino.dart';
import '../../data/models/client_workout_exercise.dart';

class SetEntryForm extends StatelessWidget {
  final ClientWorkoutExercise currentExercise;
  final int currentSetIndex;
  final Function onNextSet;
  final bool isLastSetAndExercise;

  const SetEntryForm({
    super.key,
    required this.currentExercise,
    required this.currentSetIndex,
    required this.onNextSet,
    required this.isLastSetAndExercise,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Килограмм',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          CupertinoTextField(
            placeholder: 'Килограмм',
            onChanged: (value) {
              // обработка изменений веса
            },
          ),
          const SizedBox(height: 16),
          Text(
            currentExercise.exercise.unit == 'duration'
                ? 'Продолжительность (сек)'
                : 'Повторений',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          CupertinoTextField(
            placeholder: currentExercise.exercise.unit == 'duration'
                ? 'Продолжительность (сек)'
                : 'Повторений',
            onChanged: (value) {
              // обработка изменений количества повторений или продолжительности
            },
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: CupertinoButton.filled(
              onPressed: () => onNextSet(),
              child: Text(isLastSetAndExercise
                  ? 'Завершить тренировку'
                  : 'Следующий подход'),
            ),
          ),
        ],
      ),
    );
  }
}
