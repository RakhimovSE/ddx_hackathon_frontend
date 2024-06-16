import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/client_trainer/client_trainer_bloc.dart';
import '../../bloc/client_trainer/client_trainer_state.dart';
import '../../widgets/trainer_card.dart';

class ClientTrainersSection extends StatelessWidget {
  const ClientTrainersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Ваши тренеры',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BlocBuilder<ClientTrainerBloc, ClientTrainerState>(
          builder: (context, state) {
            if (state is ClientTrainerLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is ClientTrainerLoaded) {
              if (state.clientTrainers.isNotEmpty) {
                return Column(
                  children: state.clientTrainers.map((trainer) {
                    return TrainerCard(trainer: trainer);
                  }).toList(),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Нет тренеров',
                    style: TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                );
              }
            } else if (state is ClientTrainerError) {
              return Center(
                  child:
                      Text('Не удалось загрузить тренеров: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
