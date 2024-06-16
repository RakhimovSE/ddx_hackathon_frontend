import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/client_training_plan/client_training_plan_bloc.dart';
import '../../bloc/client_training_plan/client_training_plan_event.dart';
import 'client_training_plans_section.dart';
import 'weekly_trainings_section.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ClientTrainingPlanBloc>().add(FetchClientTrainingPlans());

    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Тренировки'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClientTrainingPlansSection(),
              WeeklyTrainingsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
