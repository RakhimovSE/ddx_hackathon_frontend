import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../data/models/client_workout_exercise.dart';

class WorkoutSessionScreen extends StatefulWidget {
  final int clientWorkoutId;
  final List<ClientWorkoutExercise> exercises; // Принимаем список упражнений

  const WorkoutSessionScreen(
      {super.key, required this.clientWorkoutId, required this.exercises});

  @override
  _WorkoutSessionScreenState createState() => _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState extends State<WorkoutSessionScreen> {
  late List<ClientWorkoutExercise> exercises;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    exercises = widget.exercises; // Используем переданный список упражнений
    isLoading = false; // Так как упражнения уже переданы, загрузка не требуется
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('1/7'),
        previousPageTitle: 'Назад',
      ),
      child: SafeArea(
        child: isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : exercises.isEmpty
                ? const Center(child: Text('Упражнений нет'))
                : Column(
                    children: [
                      Image.network(
                        'https://example.com/exercise.jpg', // Placeholder for exercise image
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(CupertinoIcons.photo);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Упражнение",
                              // exercises[0].workoutExercise.exercise.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Рекомендуемый вес: 4кг каждая гантеля',
                              style: TextStyle(
                                fontSize: 16,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildInfoColumn('Повторений\nнужно', '12'),
                                _buildInfoColumn('Время\nотдыха', '01:00'),
                                _buildInfoColumn('Подходов\nсделано', '4.3'),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Килограмм',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const CupertinoTextField(
                              placeholder: 'Килограмм',
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Повторений',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const CupertinoTextField(
                              placeholder: 'Повторений',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: exercises.length,
                          itemBuilder: (context, index) {
                            final exercise = exercises[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.systemBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CupertinoColors.systemGrey
                                          .withOpacity(0.5),
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // '#${index + 1} ${exercise.workoutExercise.exercise.name}',
                                      '#${index + 1} Упражнение',
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
                                      '${DateFormat('dd MMMM', 'ru').format(exercise.plannedStartDate ?? DateTime.now())} ${DateFormat('HH:mm').format(exercise.plannedStartDate ?? DateTime.now())}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: CupertinoColors.systemGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: CupertinoColors.systemGrey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
