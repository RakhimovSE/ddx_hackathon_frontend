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
          rating: 4.5,
        ),
        TrainerCard(
          name: 'Армен Макарон',
          specialty: 'База',
          imageUrl: 'https://example.com/armen.jpg',
          rating: 4.0,
        ),
        TrainerCard(
          name: 'Лера Крафт',
          specialty: 'Скалолазание',
          imageUrl: 'https://example.com/lera.jpg',
          rating: 5.0,
        ),
        TrainerCard(
          name: 'Мила Йововна',
          specialty: 'Фитнес',
          imageUrl: 'https://example.com/mila.jpg',
          rating: 4.5,
        ),
        TrainerCard(
          name: 'Иван Петров',
          specialty: 'Кроссфит',
          imageUrl: 'https://example.com/ivan.jpg',
          rating: 4.0,
        ),
        TrainerCard(
          name: 'Елена Смирнова',
          specialty: 'Пилатес',
          imageUrl: 'https://example.com/elena.jpg',
          rating: 4.5,
        ),
        TrainerCard(
          name: 'Николай Иванов',
          specialty: 'Бокс',
          imageUrl: 'https://example.com/nikolay.jpg',
          rating: 4.0,
        ),
      ],
    );
  }
}
