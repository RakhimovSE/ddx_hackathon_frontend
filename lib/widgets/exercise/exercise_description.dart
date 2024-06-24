import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../data/models/client_workout_exercise.dart';

class ExerciseDescription extends StatefulWidget {
  final ClientWorkoutExercise exercise;
  final int currentSetIndex;

  const ExerciseDescription({
    super.key,
    required this.exercise,
    required this.currentSetIndex,
  });

  @override
  _ExerciseDescriptionState createState() => _ExerciseDescriptionState();
}

class _ExerciseDescriptionState extends State<ExerciseDescription> {
  int _currentImageIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startImageRotation();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startImageRotation() {
    if (widget.exercise.exercise.photos.isNotEmpty) {
      _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
        setState(() {
          _currentImageIndex =
              (_currentImageIndex + 1) % widget.exercise.exercise.photos.length;
        });
      });
    }
  }

  @override
  void didUpdateWidget(covariant ExerciseDescription oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.exercise != oldWidget.exercise) {
      _currentImageIndex = 0;
      _timer.cancel();
      _startImageRotation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImage(widget.exercise),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.exercise.exercise.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Рекомендуемый вес: ${widget.exercise.sets.first.restTime} кг',
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
                    widget.exercise.exercise.unit == 'duration'
                        ? 'Время\nнужно'
                        : 'Повторений\nнужно',
                    widget.exercise.exercise.unit == 'duration'
                        ? '${widget.exercise.sets[widget.currentSetIndex].duration} сек'
                        : '${widget.exercise.sets[widget.currentSetIndex].reps}',
                  ),
                  _buildInfoColumn(
                    'Время\nотдыха',
                    '${widget.exercise.sets[widget.currentSetIndex].restTime} сек',
                  ),
                  _buildInfoColumn(
                    'Подходов\nсделано',
                    '${widget.currentSetIndex + 1}/${widget.exercise.sets.length}',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImage(ClientWorkoutExercise exercise) {
    if (exercise.exercise.photos.isEmpty) {
      return const Icon(CupertinoIcons.photo);
    }
    return Image.network(
      '${dotenv.env['API_URL']}/static/${exercise.exercise.photos[_currentImageIndex].photoUrl}',
      fit: BoxFit.cover,
      width: double.infinity,
      height: 300,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Icon(CupertinoIcons.photo);
      },
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
