import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../data/models/client_workout_exercise.dart';

class ExerciseDescription extends StatelessWidget {
  final ClientWorkoutExercise exercise;
  final int currentSetIndex;

  const ExerciseDescription({
    super.key,
    required this.exercise,
    required this.currentSetIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImageCarousel(exercise),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exercise.exercise.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Рекомендуемый вес: ${exercise.sets.first.restTime} кг',
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
                      exercise.exercise.unit == 'duration'
                          ? 'Время\nнужно'
                          : 'Повторений\nнужно',
                      exercise.exercise.unit == 'duration'
                          ? '${exercise.sets[currentSetIndex].duration} сек'
                          : '${exercise.sets[currentSetIndex].reps}'),
                  _buildInfoColumn('Время\nотдыха',
                      '${exercise.sets[currentSetIndex].restTime} сек'),
                  _buildInfoColumn('Подходов\nсделано',
                      '${currentSetIndex + 1}/${exercise.sets.length}'),
                ],
              ),
            ],
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
}
