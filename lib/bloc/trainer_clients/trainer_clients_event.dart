import 'package:equatable/equatable.dart';

abstract class TrainerClientsEvent extends Equatable {
  const TrainerClientsEvent();

  @override
  List<Object> get props => [];
}

class FetchTrainerClients extends TrainerClientsEvent {}
