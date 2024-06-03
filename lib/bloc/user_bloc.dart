import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/user.dart';
import '../repositories/api_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiRepository apiRepository;

  UserBloc({required this.apiRepository}) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await apiRepository.fetchUsers();
        emit(UserLoaded(users));
      } catch (_) {
        emit(UserError());
      }
    });
  }
}
