import 'package:flutter/cupertino.dart';
import '../widgets/trainer_card.dart';
import '../widgets/stories_list.dart';
import '../widgets/trainer_list.dart';

class TrainerScreen extends StatelessWidget {
  const TrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Тренерский состав'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TrainerCard(
                name: 'Алина Колебанова',
                specialty: 'Йога, похудение',
                imageUrl: 'https://example.com/alina.jpg',
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Истории',
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                ),
              ),
              const SizedBox(height: 16),
              const StoriesList(),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CupertinoSearchTextField(
                  placeholder: 'Search for your shoes...',
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TrainerList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
