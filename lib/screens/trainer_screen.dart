import 'package:flutter/cupertino.dart';
import '../widgets/trainer_card.dart';
import '../widgets/stories_list.dart';
import '../widgets/trainer_list.dart';

class TrainerScreen extends StatelessWidget {
  const TrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Тренерский состав'),
        trailing: Icon(CupertinoIcons.chat_bubble_2_fill),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Ваш тренер',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TrainerCard(
                name: 'Алина Колебанова',
                specialty: 'Йога, похудение',
                imageUrl: 'https://example.com/alina.jpg',
                rating: 4.5,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Истории',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              StoriesList(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: CupertinoSearchTextField(
                  placeholder: 'Найти тренера...',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Список тренеров',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TrainerList(),
            ],
          ),
        ),
      ),
    );
  }
}
