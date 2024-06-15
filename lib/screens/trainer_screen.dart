import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/trainer_bloc.dart';
import '../bloc/trainer_event.dart';
import '../bloc/trainer_state.dart';
import '../repositories/api_repository.dart';
import '../widgets/trainer_card.dart';
import '../widgets/stories_list.dart';
import '../widgets/trainer_list.dart';

class TrainerScreen extends StatelessWidget {
  const TrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrainerBloc(apiRepository: ApiRepository())..add(FetchTrainers()),
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Тренерский состав'),
          trailing: Icon(CupertinoIcons.chat_bubble_2_fill),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Ваш тренер',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                BlocBuilder<TrainerBloc, TrainerState>(
                  builder: (context, state) {
                    if (state is TrainerLoading) {
                      return const Center(child: CupertinoActivityIndicator());
                    } else if (state is TrainerLoaded) {
                      if (state.trainers.isNotEmpty) {
                        return Column(
                          children: state.trainers.map((trainer) {
                            return TrainerCard(
                              name: trainer.name,
                              specialties:
                                  trainer.trainerProfile?.specialties ?? [],
                              imageUrl: trainer.avatarUrl ??
                                  'https://example.com/avatar.jpg',
                            );
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
                    } else if (state is TrainerError) {
                      return Center(
                          child: Text(
                              'Не удалось загрузить тренеров: ${state.message}'));
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Истории',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const StoriesList(),
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
                      if (state.trainers.isNotEmpty) {
                        return TrainerList(trainers: state.trainers);
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
                    } else if (state is TrainerError) {
                      return Center(
                          child: Text(
                              'Не удалось загрузить тренеров: ${state.message}'));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
