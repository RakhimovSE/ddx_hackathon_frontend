import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class UserInfo extends StatelessWidget {
  final User userData;

  const UserInfo({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:
                userData.avatarUrl != null && userData.avatarUrl!.isNotEmpty
                    ? NetworkImage(userData.avatarUrl!)
                    : null,
            child: userData.avatarUrl == null || userData.avatarUrl!.isEmpty
                ? const Icon(
                    CupertinoIcons.person,
                    size: 40,
                    color: CupertinoColors.white,
                  )
                : null,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userData.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                userData.email,
                style: const TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
