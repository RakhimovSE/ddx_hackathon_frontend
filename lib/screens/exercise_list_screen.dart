import 'package:flutter/cupertino.dart';
import '../data/models/exercise.dart';
import '../data/repositories/api_repository.dart';
import '../widgets/exercise/exercise_list.dart';

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({super.key});

  @override
  _ExerciseListScreenState createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  late Future<List<Exercise>> futureExercises;
  List<Exercise> exercises = [];
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  int offset = 0;
  final int limit = 20;

  @override
  void initState() {
    super.initState();
    _fetchMoreExercises();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchMoreExercises();
      }
    });
  }

  Future<void> _fetchMoreExercises() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    try {
      List<Exercise> newExercises =
          await ApiRepository().fetchExercises(offset: offset, limit: limit);
      setState(() {
        offset += limit;
        exercises.addAll(newExercises);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Failed to load exercises: $e');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Exercises'),
      ),
      child: ExerciseList(
        exercises: exercises,
        isLoading: isLoading,
        scrollController: _scrollController,
      ),
    );
  }
}
