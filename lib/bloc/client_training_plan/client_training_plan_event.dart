import 'package:equatable/equatable.dart';

abstract class ClientTrainingPlanEvent extends Equatable {
  const ClientTrainingPlanEvent();

  @override
  List<Object> get props => [];
}

class FetchClientTrainingPlans extends ClientTrainingPlanEvent {}
