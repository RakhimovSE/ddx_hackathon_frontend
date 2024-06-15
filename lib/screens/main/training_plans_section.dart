import 'package:flutter/cupertino.dart';

class TrainingPlansSection extends StatelessWidget {
  const TrainingPlansSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Тренировочные планы',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
      ],
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
