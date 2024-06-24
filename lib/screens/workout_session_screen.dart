import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/client_workout_exercise.dart';
import '../data/repositories/api_repository.dart';
import '../widgets/exercise/exercise_description.dart';
import '../widgets/exercise/set_entry_form.dart';
import '../widgets/exercise/completed_sets_list.dart';
import 'exercise_detail_screen.dart';
import 'main/main_screen.dart';

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

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('${currentExerciseIndex + 1}/${exercises.length}'),
        previousPageTitle: 'Назад',
        trailing: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ExerciseDetailScreen(
                    exercise: exercises[currentExerciseIndex]),
              ),
            );
          },
          child: const Icon(CupertinoIcons.question_circle),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExerciseDescription(
                exercise: currentExercise,
                currentSetIndex: currentSetIndex,
                key: ValueKey(currentExerciseIndex),
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
        _fetchExerciseSets();
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => const MainScreen()),
          (Route<dynamic> route) => false,
        );
      }
    });
  }

  bool _isLastSetAndExercise() {
    return currentSetIndex == exercises[currentExerciseIndex].sets.length - 1 &&
        currentExerciseIndex == exercises.length - 1;
  }
}
