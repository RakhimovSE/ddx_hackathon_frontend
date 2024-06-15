import 'package:flutter/cupertino.dart';
import 'custom_image.dart';
import '../models/specialty.dart';

class TrainerCard extends StatelessWidget {
  const TrainerCard({
    required this.name,
    required this.specialties,
    required this.imageUrl,
    this.rating,
    super.key,
  });

  final String name;
  final List<Specialty> specialties;
  final String imageUrl;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
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
            CustomImage(imageUrl: imageUrl, width: 80, height: 80),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    specialties.map((e) => e.name).join(", "),
                    style: const TextStyle(
                        fontSize: 16, color: CupertinoColors.systemGrey),
                  ),
                  if (rating != null) ...[
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating!
                              ? CupertinoIcons.star_fill
                              : CupertinoIcons.star,
                          color: index < rating!
                              ? CupertinoColors.systemYellow
                              : CupertinoColors.systemGrey,
                          size: 16,
                        );
                      }),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
