import 'package:flutter/cupertino.dart';
import '../models/user.dart';
import '../screens/trainer_profile_screen.dart';
import 'custom_image.dart';

class TrainerCard extends StatelessWidget {
  const TrainerCard({
    required this.trainer,
    super.key,
  });

  final User trainer;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => TrainerProfileScreen(trainer: trainer),
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
            CustomImage(
                imageUrl: trainer.avatarUrl ?? '', width: 80, height: 80),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(trainer.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    trainer.trainerProfile!.specialties
                        .map((e) => e.name)
                        .join(", "),
                    style: const TextStyle(
                        fontSize: 16, color: CupertinoColors.systemGrey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
