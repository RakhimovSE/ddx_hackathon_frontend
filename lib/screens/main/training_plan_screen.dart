import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../data/models/client_workout.dart';
import '../../data/repositories/api_repository.dart';
import 'training_schedule_card.dart';

class TrainingPlanScreen extends StatefulWidget {
  final int trainingPlanId;

  const TrainingPlanScreen({super.key, required this.trainingPlanId});

  @override
  _TrainingPlanScreenState createState() => _TrainingPlanScreenState();
}

class _TrainingPlanScreenState extends State<TrainingPlanScreen> {
  List<ClientWorkout> workouts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchWorkouts();
  }

  Future<void> _fetchWorkouts() async {
    final apiRepository = context.read<ApiRepository>();

    try {
      final fetchedWorkouts = await apiRepository
          .fetchClientWorkoutsByPlanId(widget.trainingPlanId);
      setState(() {
        workouts = fetchedWorkouts;
        isLoading = false;
      });
    } catch (e) {
      print("Failed to load workouts: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Тренировочный план'),
        previousPageTitle: 'Назад',
      ),
      child: SafeArea(
        child: isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : workouts.isEmpty
                ? const Center(child: Text('Тренировок нет'))
                : ListView.builder(
                    itemCount: workouts.length,
                    itemBuilder: (context, index) {
                      final workout = workouts[index];
                      String formattedTime = 'No time specified';
                      final DateFormat dateFormatter =
                          DateFormat('d MMMM', 'ru');
                      final DateFormat timeFormatter = DateFormat('HH:mm');
                      formattedTime =
                          '${dateFormatter.format(workout.startDate.toLocal())}, ${timeFormatter.format(workout.startDate.toLocal())}';
                                          return TrainingScheduleCard(
                        title: workout.name,
                        time: formattedTime,
                        trainer: 'Тренер', // Adjust as necessary
                        imageUrl:
                            'https://example.com/training.jpg', // Placeholder
                        clientWorkoutId: workout.id,
                      );
                    },
                  ),
      ),
    );
  }
}
