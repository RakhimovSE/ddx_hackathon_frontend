import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/training_plan_bloc.dart';
import '../repositories/api_repository.dart';

class TrainingPlanListScreen extends StatelessWidget {
  final ApiRepository apiRepository = ApiRepository();

  TrainingPlanListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainingPlanBloc(apiRepository: apiRepository)
        ..add(FetchTrainingPlans()),
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Training Plans'),
        ),
        child: BlocBuilder<TrainingPlanBloc, TrainingPlanState>(
          builder: (context, state) {
            if (state is TrainingPlanLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is TrainingPlanLoaded) {
              return ListView.builder(
                itemCount: state.plans.length,
                itemBuilder: (context, index) {
                  return CupertinoListTile(
                    title: Text(state.plans[index].title),
                    subtitle: Text(state.plans[index].content),
                  );
                },
              );
            } else if (state is TrainingPlanError) {
              return const Center(child: Text('Failed to fetch training plans'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class CupertinoListTile extends StatelessWidget {
  final Widget title;
  final Widget subtitle;

  const CupertinoListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(child: title),
              Expanded(child: subtitle),
            ],
          ),
        ),
        const Divider(height: 1, color: CupertinoColors.separator),
      ],
    );
  }
}
