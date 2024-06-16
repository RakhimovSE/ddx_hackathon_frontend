import 'package:flutter/cupertino.dart';
import '../chat_list_screen.dart';
import 'client_trainers_section.dart';
import 'stories_section.dart';
import 'trainers_list_section.dart';

class TrainerScreen extends StatelessWidget {
  const TrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<TrainerBloc>().add(FetchTrainers());
    // context.read<ClientTrainerBloc>().add(FetchClientTrainers());

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Тренерский состав'),
        trailing: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const ChatListScreen()),
            );
          },
          child: const Icon(CupertinoIcons.chat_bubble_2_fill),
        ),
      ),
      child: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClientTrainersSection(),
              StoriesSection(),
              TrainersListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
