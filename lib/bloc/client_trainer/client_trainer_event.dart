import 'package:equatable/equatable.dart';

abstract class ClientTrainerEvent extends Equatable {
  const ClientTrainerEvent();

  @override
  List<Object> get props => [];
}

class FetchClientTrainers extends ClientTrainerEvent {}
