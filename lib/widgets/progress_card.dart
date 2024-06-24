import 'package:flutter/cupertino.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String value;
  final String? unit;
  final VoidCallback onTap;

  const ProgressCard({
    super.key,
    required this.title,
    required this.value,
    this.unit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.2),
              blurRadius: 8.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: CupertinoColors.systemGrey,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),
                if (unit != null) ...[
                  const SizedBox(width: 4),
                  Text(
                    unit!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View Now',
                  style: TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.systemPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_forward,
                  color: CupertinoColors.systemGrey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
