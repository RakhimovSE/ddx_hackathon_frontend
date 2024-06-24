import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repositories/api_repository.dart';
import 'trainer_clients_event.dart';
import 'trainer_clients_state.dart';

class TrainerClientsBloc
    extends Bloc<TrainerClientsEvent, TrainerClientsState> {
  final ApiRepository apiRepository;

  TrainerClientsBloc({required this.apiRepository})
      : super(TrainerClientsInitial()) {
    on<FetchTrainerClients>((event, emit) async {
      emit(TrainerClientsLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        final userMap = prefs.getString('user');
        if (userMap != null) {
          final user = jsonDecode(userMap);
          final trainerId = user['ID'];
          final clients = await apiRepository.fetchClientsForTrainer(trainerId);
          emit(TrainerClientsLoaded(clients));
        } else {
          emit(const TrainerClientsError(
              'Trainer ID not found in SharedPreferences'));
        }
      } catch (e) {
        emit(TrainerClientsError(e.toString()));
      }
    });
  }
}
