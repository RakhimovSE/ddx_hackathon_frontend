import 'package:equatable/equatable.dart';

abstract class TrainerEvent extends Equatable {
  const TrainerEvent();

  @override
  List<Object> get props => [];
}

class FetchTrainers extends TrainerEvent {}
