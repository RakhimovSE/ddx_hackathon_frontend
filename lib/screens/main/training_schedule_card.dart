import 'package:flutter/cupertino.dart';

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
