import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/client_training_plan/client_training_plan_bloc.dart';
import '../../bloc/client_training_plan/client_training_plan_event.dart';
import 'client_training_plans_section.dart';
import 'weekly_trainings_section.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Future<void> _onRefresh(BuildContext context,
      GlobalKey<WeeklyTrainingsSectionState> weeklyTrainingsKey) async {
    context.read<ClientTrainingPlanBloc>().add(FetchClientTrainingPlans());
    await weeklyTrainingsKey.currentState?.fetchWorkoutsForSelectedDay();
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<WeeklyTrainingsSectionState> weeklyTrainingsKey =
        GlobalKey<WeeklyTrainingsSectionState>();

    context.read<ClientTrainingPlanBloc>().add(FetchClientTrainingPlans());

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Тренировки'),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: () => _onRefresh(context, weeklyTrainingsKey),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const ClientTrainingPlansSection(),
                  WeeklyTrainingsSection(key: weeklyTrainingsKey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
