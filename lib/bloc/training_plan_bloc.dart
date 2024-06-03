import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/training_plan.dart';
import '../repositories/api_repository.dart';

part 'training_plan_event.dart';
part 'training_plan_state.dart';

class TrainingPlanBloc extends Bloc<TrainingPlanEvent, TrainingPlanState> {
  final ApiRepository apiRepository;

  TrainingPlanBloc({required this.apiRepository})
      : super(TrainingPlanInitial()) {
    on<FetchTrainingPlans>((event, emit) async {
      emit(TrainingPlanLoading());
      try {
        final plans = await apiRepository.fetchTrainingPlans();
        emit(TrainingPlanLoaded(plans));
      } catch (_) {
        emit(TrainingPlanError());
      }
    });
  }
}
