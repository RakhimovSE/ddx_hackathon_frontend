import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/client_workout_exercise.dart';
import '../data/repositories/api_repository.dart';
import '../widgets/exercise/exercise_description.dart';
import '../widgets/exercise/set_entry_form.dart';
import '../widgets/exercise/completed_sets_list.dart';

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
  late List<ClientWorkoutExercise> completedExercises;

  @override
  void initState() {
    super.initState();
    exercises = widget.exercises;
    currentExerciseIndex = 0;
    currentSetIndex = 0;
    completedExercises = [];
    _fetchExerciseSets();
  }

  Future<void> _fetchExerciseSets() async {
    final apiRepository = context.read<ApiRepository>();
    final exerciseId = exercises[currentExerciseIndex].exercise.id;

    final prefs = await SharedPreferences.getInstance();
    final userMap = prefs.getString('user');
    if (userMap != null) {
      final user = jsonDecode(userMap);
      final clientId = user['ID'];

      try {
        final fetchedExercises = await apiRepository
            .fetchClientCompletedExercises(clientId, exerciseId);
        setState(() {
          completedExercises = fetchedExercises;
        });
      } catch (e) {
        print("Failed to load completed exercises: $e");
      }
    }
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExerciseDescription(
                exercise: currentExercise,
                currentSetIndex: currentSetIndex,
              ),
              SetEntryForm(
                currentExercise: currentExercise,
                currentSetIndex: currentSetIndex,
                onNextSet: _nextSet,
                isLastSetAndExercise: _isLastSetAndExercise(),
              ),
              CompletedSetsList(completedExercises: completedExercises),
            ],
          ),
        ),
      ),
    );
  }

  void _nextSet() {
    setState(() {
      if (currentSetIndex < exercises[currentExerciseIndex].sets.length - 1) {
        currentSetIndex++;
      } else if (currentExerciseIndex < exercises.length - 1) {
        currentExerciseIndex++;
        currentSetIndex = 0;
        _fetchExerciseSets(); // Fetch sets for the next exercise
      } else {
        // End of workout logic
        print("Workout complete!");
      }
    });
  }

  bool _isLastSetAndExercise() {
    return currentSetIndex == exercises[currentExerciseIndex].sets.length - 1 &&
        currentExerciseIndex == exercises.length - 1;
  }
}
