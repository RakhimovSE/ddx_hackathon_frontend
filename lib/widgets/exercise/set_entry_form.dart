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
          Row(
            children: [
              if (currentExercise.exercise.needWeight)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Вес (кг)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CupertinoTextField(
                        placeholder: 'Вес (кг)',
                        onChanged: (value) {
                          // обработка изменений веса
                        },
                      ),
                    ],
                  ),
                ),
              if (currentExercise.exercise.needWeight)
                const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentExercise.exercise.unit == 'duration'
                          ? 'Время (сек)'
                          : 'Повторений',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CupertinoTextField(
                      placeholder: currentExercise.exercise.unit == 'duration'
                          ? 'Время (сек)'
                          : 'Повторений',
                      onChanged: (value) {
                        // обработка изменений количества повторений или продолжительности
                      },
                    ),
                  ],
                ),
              ),
            ],
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
