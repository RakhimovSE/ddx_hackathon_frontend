import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_image.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    required this.name,
    required this.role,
    required this.imageUrl,
    super.key,
  });

  final String name;
  final String role;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: CupertinoColors.systemGrey,
            child: ClipOval(
              child: CustomImage(imageUrl: imageUrl, width: 60, height: 60),
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              name,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            child: Text(
              role,
              style: const TextStyle(
                fontSize: 12,
                color: CupertinoColors.systemGrey,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
