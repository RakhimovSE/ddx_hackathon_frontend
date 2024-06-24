import 'package:ddx_hackathon_frontend/data/models/client_training_plan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/client_workout.dart';
import '../../data/repositories/api_repository.dart';
import 'training_schedule_card.dart';

class TrainingPlanScreen extends StatefulWidget {
  final ClientTrainingPlan trainingPlan;

  const TrainingPlanScreen({super.key, required this.trainingPlan});

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
          .fetchClientWorkoutsByPlanId(widget.trainingPlan.id);
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
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildHeader(
                            widget.trainingPlan), // Передаем план в заголовок
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: workouts.length,
                          itemBuilder: (context, index) {
                            final workout = workouts[index];
                            return TrainingScheduleCard(
                              index: index + 1,
                              title: workout.name,
                              duration: '45 минут', // Placeholder for duration
                              clientWorkoutId: workout.id,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget _buildHeader(ClientTrainingPlan plan) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Карточка с основной информацией о тренировочном плане
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${workouts.length} тренировки',
                  style: TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      plan.createdBy.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.white,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.activeBlue,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Text(
                        '45%', // Placeholder for progress
                        style: TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Описание
          const Text(
            'Похудение, в зале, с экипировкой', // Placeholder for description tags
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.activeGreen,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Комплексная программа тренировок',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Этот тренировочный план включает разнообразные упражнения для улучшения общей физической подготовки, повышения выносливости и укрепления мышц.',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.systemGrey,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Программа разработана для выполнения в зале и рассчитана на использование различных типов оборудования.',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.systemGrey,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
