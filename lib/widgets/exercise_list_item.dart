import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/exercise.dart';

class ExerciseListItem extends StatelessWidget {
  final Exercise exercise;

  const ExerciseListItem({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: exercise.photos.isNotEmpty
            ? Image.network(
                '${dotenv.env['API_URL']}/static/${exercise.photos[0].photoUrl}',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(CupertinoIcons.photo);
                },
              )
            : const Icon(CupertinoIcons.photo),
        title: Text(exercise.name),
        subtitle: Text(exercise.muscle),
      ),
    );
  }
}
