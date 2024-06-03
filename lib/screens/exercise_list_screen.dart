import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/exercise.dart';
import '../repositories/api_repository.dart';

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({super.key});

  @override
  _ExerciseListScreenState createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  late Future<List<Exercise>> futureExercises;

  @override
  void initState() {
    super.initState();
    futureExercises = ApiRepository().fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Exercises'),
      ),
      child: FutureBuilder<List<Exercise>>(
        future: futureExercises,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No exercises found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final exercise = snapshot.data![index];
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
              },
            );
          }
        },
      ),
    );
  }
}
