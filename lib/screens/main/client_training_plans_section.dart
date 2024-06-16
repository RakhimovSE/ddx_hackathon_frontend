import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/client_training_plan/client_training_plan_bloc.dart';
import '../../bloc/client_training_plan/client_training_plan_state.dart';
import 'training_card.dart';

class ClientTrainingPlansSection extends StatelessWidget {
  const ClientTrainingPlansSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Тренировочные планы',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BlocBuilder<ClientTrainingPlanBloc, ClientTrainingPlanState>(
          builder: (context, state) {
            if (state is ClientTrainingPlanLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is ClientTrainingPlanLoaded) {
              if (state.trainingPlans.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'У вас нет тренировочных планов.',
                      style: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ),
                );
              }
              return Column(
                children: state.trainingPlans.map((plan) {
                  return TrainingCard(
                    title: plan.name,
                    subtitle: plan.description,
                    trainer: 'Тренер', // Placeholder, update as needed
                    progress: 0, // Placeholder, update as needed
                    imageUrl: '', // Placeholder, update as needed
                    trainingPlanId: plan.id,
                  );
                }).toList(),
              );
            } else if (state is ClientTrainingPlanError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
