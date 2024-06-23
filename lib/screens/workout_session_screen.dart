import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../data/models/client_workout_exercise.dart';

class WorkoutSessionScreen extends StatefulWidget {
  final int clientWorkoutId;
  final List<ClientWorkoutExercise> exercises;

  const WorkoutSessionScreen({
    super.key,
    required this.clientWorkoutId,
    required this.exercises,
  });

  @override
  _WorkoutSessionScreenState createState() => _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState extends State<WorkoutSessionScreen> {
  late List<ClientWorkoutExercise> exercises;
  late int currentExerciseIndex;
  late int currentSetIndex;

  @override
  void initState() {
    super.initState();
    exercises = widget.exercises;
    currentExerciseIndex = 0;
    currentSetIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentExercise = exercises[currentExerciseIndex];
    final currentSet = currentExercise.sets[currentSetIndex];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
            '${currentExerciseIndex + 1}/${exercises.length} упражнений выполнено'),
        previousPageTitle: 'Назад',
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildImageCarousel(currentExercise),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentExercise.exercise.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Рекомендуемый вес: ${currentSet.restTime} кг',
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildInfoColumn(
                          'Повторений\nнужно', '${currentSet.reps}'),
                      _buildInfoColumn(
                          'Время\nотдыха', '${currentExercise.restTime} сек'),
                      _buildInfoColumn('Подходов\nсделано',
                          '${currentSetIndex + 1}/${currentExercise.sets.length}'),
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
                  CupertinoTextField(
                    placeholder: 'Килограмм',
                    onChanged: (value) {
                      // обработка изменений веса
                    },
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
                  CupertinoTextField(
                    placeholder: 'Повторений',
                    onChanged: (value) {
                      // обработка изменений повторений
                    },
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
                            '#${index + 1} ${exercise.exercise.name}',
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
            CupertinoButton.filled(
              onPressed: _nextSet,
              child: Text('Следующий подход'),
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

  Widget _buildImageCarousel(ClientWorkoutExercise exercise) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 0,
      ),
      items: exercise.exercise.photos.map((photo) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
              '${dotenv.env['API_URL']}/static/${photo.photoUrl}',
              fit: BoxFit.cover,
              width: 1000,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Icon(CupertinoIcons.photo);
              },
            );
          },
        );
      }).toList(),
    );
  }

  void _nextSet() {
    setState(() {
      if (currentSetIndex < exercises[currentExerciseIndex].sets.length - 1) {
        currentSetIndex++;
      } else if (currentExerciseIndex < exercises.length - 1) {
        currentExerciseIndex++;
        currentSetIndex = 0;
      }
    });
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
