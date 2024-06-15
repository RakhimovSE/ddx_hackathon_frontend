import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/trainer_card.dart';
import '../widgets/stories_list.dart';
import '../widgets/trainer_list.dart';

class TrainerScreen extends StatelessWidget {
  const TrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Тренерский состав'),
        trailing: Stack(
          children: <Widget>[
            const Icon(CupertinoIcons.conversation_bubble),
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
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
                  placeholder: 'Найти тренера...',
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
