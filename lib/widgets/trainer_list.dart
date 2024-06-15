import 'package:flutter/cupertino.dart';
import '../models/user.dart';
import 'trainer_card.dart';

class TrainerList extends StatelessWidget {
  final List<User> trainers;

  const TrainerList({super.key, required this.trainers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          trainers.map((trainer) => TrainerCard(trainer: trainer)).toList(),
    );
  }
}
