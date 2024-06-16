import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repositories/api_repository.dart';
import 'client_training_plan_event.dart';
import 'client_training_plan_state.dart';
import 'dart:convert';

class ClientTrainingPlanBloc
    extends Bloc<ClientTrainingPlanEvent, ClientTrainingPlanState> {
  final ApiRepository apiRepository;

  ClientTrainingPlanBloc({required this.apiRepository})
      : super(ClientTrainingPlanInitial()) {
    on<FetchClientTrainingPlans>((event, emit) async {
      emit(ClientTrainingPlanLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        final userMap = prefs.getString('user');
        if (userMap != null) {
          final user = jsonDecode(userMap);
          final clientId = user['ID'];
          final trainingPlans =
              await apiRepository.fetchClientTrainingPlans(clientId);
          emit(ClientTrainingPlanLoaded(trainingPlans));
        } else {
          emit(const ClientTrainingPlanError(
              'Client ID not found in SharedPreferences'));
        }
      } catch (e) {
        emit(ClientTrainingPlanError(e.toString()));
      }
    });
  }
}
