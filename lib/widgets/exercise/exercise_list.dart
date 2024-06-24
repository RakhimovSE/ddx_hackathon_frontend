import 'package:flutter/cupertino.dart';
import '../../data/models/exercise.dart';
import '../../screens/exercise_detail_screen.dart';
import 'exercise_list_item.dart';

class ExerciseList extends StatelessWidget {
  final List<Exercise> exercises;
  final bool isLoading;
  final ScrollController scrollController;

  const ExerciseList({
    super.key,
    required this.exercises,
    required this.isLoading,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: exercises.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == exercises.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        return ExerciseListItem(
          exercise: exercises[index],
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ExerciseDetailScreen(
                  exercise: exercises[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
