import 'package:equatable/equatable.dart';
import '../../data/models/user.dart';

abstract class TrainerClientsState extends Equatable {
  const TrainerClientsState();

  @override
  List<Object> get props => [];
}

class TrainerClientsInitial extends TrainerClientsState {}

class TrainerClientsLoading extends TrainerClientsState {}

class TrainerClientsLoaded extends TrainerClientsState {
  final List<User> clients;

  const TrainerClientsLoaded(this.clients);

  @override
  List<Object> get props => [clients];
}

class TrainerClientsError extends TrainerClientsState {
  final String message;

  const TrainerClientsError(this.message);

  @override
  List<Object> get props => [message];
}
