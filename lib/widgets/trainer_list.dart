import 'package:flutter/cupertino.dart';
import 'trainer_card.dart';

class TrainerList extends StatelessWidget {
  const TrainerList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TrainerCard(
          name: 'Алина Колебанова',
          specialty: 'Йога, похудение',
          imageUrl: 'https://example.com/alina.jpg',
        ),
        TrainerCard(
          name: 'Армен Макарон',
          specialty: 'База',
          imageUrl: 'https://example.com/armen.jpg',
        ),
        TrainerCard(
          name: 'Лера Крафт',
          specialty: 'Скалолазание',
          imageUrl: 'https://example.com/lera.jpg',
        ),
        TrainerCard(
          name: 'Мила Йововна',
          specialty: 'Фитнес',
          imageUrl: 'https://example.com/mila.jpg',
        ),
      ],
    );
  }
}
