import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/client_workout_exercise.dart';
import '../../data/repositories/api_repository.dart';

class WorkoutExercisesScreen extends StatefulWidget {
  final int clientWorkoutId;

  const WorkoutExercisesScreen({super.key, required this.clientWorkoutId});

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
                      Expanded(
                        child: ListView.builder(
                          itemCount: exercises.length,
                          itemBuilder: (context, index) {
                            final exercise = exercises[index];
                            return CupertinoListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(24.0),
                                child: Image.network(
                                  'https://example.com/exercise.jpg', // Placeholder for exercise image
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return const Icon(CupertinoIcons.photo);
                                  },
                                ),
                              ),
                              title: Text(exerciseSetsDescription(exercise)),
                              subtitle: Text('${exercise.restTime} минут'),
                              trailing: const CupertinoListTileChevron(),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        width: double.infinity,
                        child: CupertinoButton.filled(
                          onPressed: () {
                            // Start workout action
                          },
                          child: const Text('Начать тренировку'),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  String exerciseSetsDescription(ClientWorkoutExercise exercise) {
    return exercise.sets
        .map((set) =>
            '${set.reps}x${set.duration > 0 ? '${set.duration}сек' : ''}${set.restTime > 0 ? 'x${set.restTime}кг' : ''}')
        .join(', ');
  }
}
