import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../data/models/client_workout_exercise.dart';
import '../../data/repositories/api_repository.dart';
import '../data/models/exercise.dart';
import 'exercise_detail_screen.dart';
import 'workout_session_screen.dart';

class WorkoutExercisesScreen extends StatefulWidget {
  final int clientWorkoutId;
  final int clientWorkoutIndex;
  final String clientWorkoutTitle;

  const WorkoutExercisesScreen({
    super.key,
    required this.clientWorkoutId,
    required this.clientWorkoutIndex,
    required this.clientWorkoutTitle,
  });

  @override
  _WorkoutExercisesScreenState createState() => _WorkoutExercisesScreenState();
}

class _WorkoutExercisesScreenState extends State<WorkoutExercisesScreen> {
  List<ClientWorkoutExercise> exercises = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchExercises();
  }

  Future<void> _fetchExercises() async {
    final apiRepository = context.read<ApiRepository>();

    try {
      final fetchedExercises = await apiRepository
          .fetchClientWorkoutExercises(widget.clientWorkoutId);
      setState(() {
        exercises = fetchedExercises;
        isLoading = false;
      });
    } catch (e) {
      print("Failed to load exercises: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Тренировка'),
        previousPageTitle: 'Назад',
      ),
      child: SafeArea(
        child: isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : exercises.isEmpty
                ? const Center(child: Text('Упражнений нет'))
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              '#${widget.clientWorkoutIndex} ${widget.clientWorkoutTitle}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '~ 45 минут',
                              style: TextStyle(
                                fontSize: 16,
                                color: CupertinoColors.systemGrey,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: exercises.length,
                          itemBuilder: (context, index) {
                            final exercise = exercises[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => ExerciseDetailScreen(
                                      exercise: exercise,
                                    ),
                                  ),
                                );
                              },
                              child: _buildExerciseCard(exercise),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        width: double.infinity,
                        child: CupertinoButton.filled(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => WorkoutSessionScreen(
                                  clientWorkoutId: widget.clientWorkoutId,
                                  exercises: exercises,
                                ),
                              ),
                            );
                          },
                          child: const Text('Начать тренировку'),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  Widget _buildExerciseCard(ClientWorkoutExercise exercise) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(8.0),
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
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              exercise.exercise.photos.isNotEmpty
                  ? '${dotenv.env['API_URL']}/static/${exercise.exercise.photos.first.photoUrl}'
                  : 'https://example.com/default.jpg',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Icon(CupertinoIcons.photo);
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
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
                  '${Random().nextInt(11) + 5} минут',
                  style: const TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(CupertinoIcons.chevron_forward,
              color: CupertinoColors.systemGrey),
        ],
      ),
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

  String exerciseEquipmentsDescription(Exercise exercise) {
    return exercise.equipments.map((e) => e.name).join(', ');
  }
}
