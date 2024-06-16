import 'package:equatable/equatable.dart';
import '../../data/models/client_training_plan.dart';

abstract class ClientTrainingPlanState extends Equatable {
  const ClientTrainingPlanState();

  @override
  List<Object> get props => [];
}

class ClientTrainingPlanInitial extends ClientTrainingPlanState {}

class ClientTrainingPlanLoading extends ClientTrainingPlanState {}

class ClientTrainingPlanLoaded extends ClientTrainingPlanState {
  final List<ClientTrainingPlan> trainingPlans;

  const ClientTrainingPlanLoaded(this.trainingPlans);

  @override
  List<Object> get props => [trainingPlans];
}

class ClientTrainingPlanError extends ClientTrainingPlanState {
  final String message;

  const ClientTrainingPlanError(this.message);

  @override
  List<Object> get props => [message];
}
