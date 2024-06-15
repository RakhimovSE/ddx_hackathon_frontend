import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repositories/api_repository.dart';
import 'client_trainer_event.dart';
import 'client_trainer_state.dart';

class ClientTrainerBloc extends Bloc<ClientTrainerEvent, ClientTrainerState> {
  final ApiRepository apiRepository;

  ClientTrainerBloc({required this.apiRepository})
      : super(ClientTrainerInitial()) {
    on<FetchClientTrainers>((event, emit) async {
      emit(ClientTrainerLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        final userMap = prefs.getString('user');
        if (userMap != null) {
          final user = jsonDecode(userMap);
          final clientId = user['ID'];
          final trainers = await apiRepository.fetchTrainersForClient(clientId);
          emit(ClientTrainerLoaded(trainers));
        } else {
          emit(const ClientTrainerError(
              'Client ID not found in SharedPreferences'));
        }
      } catch (e) {
        emit(ClientTrainerError(e.toString()));
      }
    });
  }
}
