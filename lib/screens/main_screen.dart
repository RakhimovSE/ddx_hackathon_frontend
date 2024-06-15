import 'package:flutter/cupertino.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Тренировки'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Тренировки',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Cards for different training programs
              TrainingCard(
                title: 'ПОХУДЕНИЕ СТАРТ',
                subtitle: '3/24 тренировок',
                trainer: 'Алина Колебанова',
                progress: 45,
                imageUrl: 'https://example.com/training1.jpg',
              ),
              TrainingCard(
                title: 'ЙОГА ДЛЯ НОВИЧКОВ',
                subtitle: '1/12 тренировок',
                trainer: 'Алина Колебанова',
                progress: 20,
                imageUrl: 'https://example.com/training2.jpg',
              ),
              // Calendar and training schedule
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'June 2024',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Calendar(),
              TrainingSchedule(),
            ],
          ),
        ),
      ),
    );
  }
}

class TrainingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trainer;
  final int progress;
  final String imageUrl;

  const TrainingCard({
    required this.title,
    required this.subtitle,
    required this.trainer,
    required this.progress,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image.network(
          //   imageUrl,
          //   width: 100,
          //   height: 100,
          //   fit: BoxFit.cover,
          // ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 16, color: CupertinoColors.systemGrey)),
                Text(trainer,
                    style: const TextStyle(
                        fontSize: 16, color: CupertinoColors.activeBlue)),
              ],
            ),
          ),
          Column(
            children: [
              Text('$progress%',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              CupertinoActivityIndicator.partiallyRevealed(
                radius: 15.0,
                progress: progress / 100.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(CupertinoIcons.back),
              Text(
                'June 2024',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(CupertinoIcons.forward),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              return const Column(
                children: [
                  Text('Mon',
                      style: TextStyle(color: CupertinoColors.systemGrey)),
                  SizedBox(height: 4),
                  Text('10'),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

class TrainingSchedule extends StatelessWidget {
  const TrainingSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TrainingScheduleCard(
          title: 'Ноги + плечи',
          time: '14:30 Тренировка #4',
          trainer: 'Алина Колебанова',
          imageUrl: 'https://example.com/training3.jpg',
        ),
        TrainingScheduleCard(
          title: 'Йога вводное',
          time: 'Тренировка #2',
          trainer: null,
          imageUrl: 'https://example.com/training4.jpg',
        ),
      ],
    );
  }
}

class TrainingScheduleCard extends StatelessWidget {
  final String title;
  final String time;
  final String? trainer;
  final String imageUrl;

  const TrainingScheduleCard({
    required this.title,
    required this.time,
    this.trainer,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image.network(
          //   imageUrl,
          //   width: 60,
          //   height: 60,
          //   fit: BoxFit.cover,
          // ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time,
                    style: const TextStyle(
                        fontSize: 16, color: CupertinoColors.systemGrey)),
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                if (trainer != null)
                  Text(trainer!,
                      style: const TextStyle(
                          fontSize: 16, color: CupertinoColors.activeBlue)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
