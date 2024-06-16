import 'package:flutter/cupertino.dart';
import 'training_plan_screen.dart';

class TrainingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trainer;
  final int progress;
  final String imageUrl;
  final int trainingPlanId;

  const TrainingCard({
    required this.title,
    required this.subtitle,
    required this.trainer,
    required this.progress,
    required this.imageUrl,
    required this.trainingPlanId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) =>
                TrainingPlanScreen(trainingPlanId: trainingPlanId),
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}
