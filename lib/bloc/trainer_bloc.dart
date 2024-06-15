import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repositories/api_repository.dart';
import 'trainer_event.dart';
import 'trainer_state.dart';

class TrainerBloc extends Bloc<TrainerEvent, TrainerState> {
  final ApiRepository apiRepository;

  TrainerBloc({required this.apiRepository}) : super(TrainerInitial()) {
    on<FetchTrainers>((event, emit) async {
      emit(TrainerLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        final userMap = prefs.getString('user');
        if (userMap != null) {
          final user = jsonDecode(userMap);
          final clientId = user['ID'];
          final trainers = await apiRepository.fetchTrainersForClient(clientId);
          emit(TrainerLoaded(trainers));
        } else {
          emit(const TrainerError('Client ID not found in SharedPreferences'));
        }
      } catch (e) {
        emit(TrainerError(e.toString()));
      }
    });
  }
}
