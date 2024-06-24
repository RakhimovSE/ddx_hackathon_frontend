import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../data/models/client_workout_exercise.dart';
import '../widgets/tag_widget.dart'; // Import the TagWidget

class ExerciseDetailScreen extends StatefulWidget {
  final ClientWorkoutExercise exercise;

  const ExerciseDetailScreen({super.key, required this.exercise});

  @override
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
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
  void didUpdateWidget(covariant ExerciseDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.exercise != oldWidget.exercise) {
      _currentImageIndex = 0;
      _timer.cancel();
      _startImageRotation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Упражнение'),
        previousPageTitle: 'Назад',
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Полное описание упражнения зачем оно, на какие мышцы, специфика плюсы и минус и еще какая-то инфа',
                      style: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildSectionTitle('Инструкция'),
                    ...List.generate(
                        2,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                '${index + 1}. Плейсхолдер для инструкции',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )),
                    const SizedBox(height: 16),
                    _buildSectionTitle('Предупреждения'),
                    ...List.generate(
                        2,
                        (index) => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Плейсхолдер для предупреждения',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: CupertinoColors.systemRed,
                                ),
                              ),
                            )),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildTags(),
            ],
          ),
        ),
      ),
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.systemBlue,
      ),
    );
  }

  Widget _buildTags() {
    List<Widget> tags = [];

    // Define colors for each category
    Color muscleColor = CupertinoColors.activeBlue;
    Color typeColor = CupertinoColors.activeGreen;
    Color equipmentColor = CupertinoColors.activeOrange;
    Color difficultyColor = CupertinoColors.systemPurple;

    tags.addAll(widget.exercise.exercise.muscles
        .map((muscle) => TagWidget(tag: muscle.name, color: muscleColor)));
    tags.add(
        TagWidget(tag: widget.exercise.exercise.type.name, color: typeColor));
    tags.addAll(widget.exercise.exercise.equipments.map(
        (equipment) => TagWidget(tag: equipment.name, color: equipmentColor)));
    tags.add(TagWidget(
        tag: widget.exercise.exercise.difficulty.level,
        color: difficultyColor));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: tags,
      ),
    );
  }
}
