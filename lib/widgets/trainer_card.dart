import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_image.dart';

class TrainerCard extends StatelessWidget {
  const TrainerCard({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    super.key,
  });

  final String name;
  final String specialty;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Card(
        child: Row(
          children: [
            CustomImage(imageUrl: imageUrl, width: 100, height: 100),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                Text(specialty,
                    style: const TextStyle(
                        fontSize: 16, color: CupertinoColors.systemGrey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
