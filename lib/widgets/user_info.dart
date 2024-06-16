import 'package:flutter/cupertino.dart';
import '../data/models/user.dart';

class UserInfo extends StatelessWidget {
  final User userData;

  const UserInfo({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  userData.avatarUrl != null && userData.avatarUrl!.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(userData.avatarUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
              color: CupertinoColors.systemGrey.withOpacity(0.2),
            ),
            child: userData.avatarUrl == null || userData.avatarUrl!.isEmpty
                ? const Icon(
                    CupertinoIcons.person,
                    size: 40,
                    color: CupertinoColors.systemGrey,
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
