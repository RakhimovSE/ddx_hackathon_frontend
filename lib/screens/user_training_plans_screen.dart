import 'package:flutter/cupertino.dart';
import '../data/models/training_plan.dart';
import '../data/repositories/api_repository.dart';

class UserTrainingPlansScreen extends StatefulWidget {
  final int userId;

  const UserTrainingPlansScreen({super.key, required this.userId});

  @override
  _UserTrainingPlansScreenState createState() =>
      _UserTrainingPlansScreenState();
}

class _UserTrainingPlansScreenState extends State<UserTrainingPlansScreen> {
  late Future<List<TrainingPlan>> futureTrainingPlans;

  @override
  void initState() {
    super.initState();
    futureTrainingPlans = ApiRepository().fetchUserTrainingPlans(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Планы тренировок'),
      ),
      child: FutureBuilder<List<TrainingPlan>>(
        future: futureTrainingPlans,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No training plans found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final plan = snapshot.data![index];
                return _buildTrainingPlanTile(plan);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildTrainingPlanTile(TrainingPlan plan) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.5),
            blurRadius: 5.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plan.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text('Текст описания плана тренировок'),
          const SizedBox(height: 4),
          const Text('Сложность: 3.4'),
          const SizedBox(height: 4),
          const Text('Рейтинг: 4.5'),
        ],
      ),
    );
  }
}
