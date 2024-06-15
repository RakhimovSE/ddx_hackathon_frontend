import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/trainer_bloc.dart';
import '../../bloc/trainer_state.dart';
import '../../widgets/trainer_list.dart';

class TrainersListSection extends StatelessWidget {
  const TrainersListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Список тренеров',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CupertinoSearchTextField(
            placeholder: 'Найти тренера...',
          ),
        ),
        BlocBuilder<TrainerBloc, TrainerState>(
          builder: (context, state) {
            if (state is TrainerLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is TrainerLoaded) {
              return TrainerList(trainers: state.trainers);
            } else if (state is TrainerError) {
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
