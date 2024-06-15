import 'package:flutter/cupertino.dart';
import '../models/user.dart';
import 'trainer_card.dart';

class TrainerList extends StatelessWidget {
  final List<User> trainers;

  const TrainerList({super.key, required this.trainers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: trainers
          .map((trainer) => TrainerCard(
                name: trainer.name,
                specialties: trainer.trainerProfile?.specialties ?? [],
                imageUrl: trainer.avatarUrl ?? '',
                rating: 4,
              ))
          .toList(),
    );
  }
}
