import 'package:flutter/cupertino.dart';
import '../data/models/user.dart';
import '../widgets/custom_image.dart';

class TrainerProfileScreen extends StatelessWidget {
  final User trainer;

  const TrainerProfileScreen({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(trainer.name),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trainer.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                trainer.trainerProfile!.specialties
                    .map((e) => e.name)
                    .join(", "),
                style: const TextStyle(
                  fontSize: 18,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Стаж: ${_formatExperience(trainer.trainerProfile!.experience)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'О себе: ${trainer.trainerProfile!.bio}',
                style: const TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  child: const Text('Написать сообщение'),
                  onPressed: () {
                    // Handle message button press
                  },
                ),
              ),
              const SizedBox(height: 16),
              CustomImage(
                imageUrl: trainer.avatarUrl ?? '',
                width: double.infinity,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatExperience(int months) {
    if (months < 12) {
      return '$months месяцев';
    } else {
      int years = months ~/ 12;
      return '$years лет';
    }
  }

  Widget _buildRatingColumn(String label, double rating) {
    return Column(
      children: [
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: CupertinoColors.systemGrey,
          ),
        ),
      ],
    );
  }
}
