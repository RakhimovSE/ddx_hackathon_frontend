part of 'training_plan_bloc.dart';

abstract class TrainingPlanEvent extends Equatable {
  const TrainingPlanEvent();

  @override
  List<Object> get props => [];
}

class FetchTrainingPlans extends TrainingPlanEvent {}
