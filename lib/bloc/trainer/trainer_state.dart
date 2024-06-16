import 'package:equatable/equatable.dart';
import '../../data/models/user.dart';

abstract class TrainerState extends Equatable {
  const TrainerState();

  @override
  List<Object> get props => [];
}

class TrainerInitial extends TrainerState {}

class TrainerLoading extends TrainerState {}

class TrainerLoaded extends TrainerState {
  final List<User> trainers;

  const TrainerLoaded(this.trainers);

  @override
  List<Object> get props => [trainers];
}

class TrainerError extends TrainerState {
  final String message;

  const TrainerError(this.message);

  @override
  List<Object> get props => [message];
}
