import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/client_trainer/client_trainer_bloc.dart';
import '../../bloc/client_trainer/client_trainer_state.dart';
import 'story_widget.dart';

class StoriesList extends StatelessWidget {
  const StoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientTrainerBloc, ClientTrainerState>(
      builder: (context, state) {
        if (state is ClientTrainerLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is ClientTrainerLoaded) {
          return SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: state.clientTrainers.map((trainer) {
                String specialties = trainer.trainerProfile?.specialties
                        .map((specialty) => specialty.name)
                        .join(', ') ??
                    'No specialties';
                return StoryWidget(
                  name: trainer.name,
                  specialties: specialties,
                  imageUrl: trainer.avatarUrl ?? '',
                );
              }).toList(),
            ),
          );
        } else {
          return const Center(child: Text('Failed to load trainers'));
        }
      },
    );
  }
}
