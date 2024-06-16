import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/api_repository.dart';
import 'trainer_event.dart';
import 'trainer_state.dart';

class TrainerBloc extends Bloc<TrainerEvent, TrainerState> {
  final ApiRepository apiRepository;

  TrainerBloc({required this.apiRepository}) : super(TrainerInitial()) {
    on<FetchTrainers>((event, emit) async {
      emit(TrainerLoading());
      try {
        final trainers = await apiRepository.fetchTrainers();
        emit(TrainerLoaded(trainers));
      } catch (e) {
        emit(TrainerError(e.toString()));
      }
    });
  }
}
