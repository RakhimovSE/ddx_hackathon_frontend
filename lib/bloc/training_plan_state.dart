part of 'training_plan_bloc.dart';

abstract class TrainingPlanState extends Equatable {
  const TrainingPlanState();

  @override
  List<Object> get props => [];
}

class TrainingPlanInitial extends TrainingPlanState {}

class TrainingPlanLoading extends TrainingPlanState {}

class TrainingPlanLoaded extends TrainingPlanState {
  final List<TrainingPlan> plans;

  const TrainingPlanLoaded(this.plans);

  @override
  List<Object> get props => [plans];
}

class TrainingPlanError extends TrainingPlanState {}
