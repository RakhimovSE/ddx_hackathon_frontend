import 'package:equatable/equatable.dart';
import '../../models/user.dart';

abstract class ClientTrainerState extends Equatable {
  const ClientTrainerState();

  @override
  List<Object> get props => [];
}

class ClientTrainerInitial extends ClientTrainerState {}

class ClientTrainerLoading extends ClientTrainerState {}

class ClientTrainerLoaded extends ClientTrainerState {
  final List<User> clientTrainers;

  const ClientTrainerLoaded(this.clientTrainers);

  @override
  List<Object> get props => [clientTrainers];
}

class ClientTrainerError extends ClientTrainerState {
  final String message;

  const ClientTrainerError(this.message);

  @override
  List<Object> get props => [message];
}
