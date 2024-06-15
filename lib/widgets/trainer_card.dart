import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_image.dart';

class TrainerCard extends StatelessWidget {
  const TrainerCard({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    this.rating,
    super.key,
  });

  final String name;
  final String specialty;
  final String imageUrl;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    Text(specialty,
                        style: const TextStyle(
                            fontSize: 16, color: CupertinoColors.systemGrey)),
                    if (rating != null) ...[
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < rating!
                                ? CupertinoIcons.star_fill
                                : CupertinoIcons.star,
                            color:
                                index < rating! ? Colors.purple : Colors.grey,
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
      ),
    );
  }
}
