import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/exercise.dart';
import 'custom_image.dart';

class ExerciseListItem extends StatelessWidget {
  final Exercise exercise;

  const ExerciseListItem({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: CupertinoColors.systemBackground,
          border: Border(
            bottom: BorderSide(
              color: CupertinoColors.separator,
              width: 0.0,
            ),
          ),
        ),
        child: Row(
          children: [
            exercise.photos.isNotEmpty
                ? CustomImage(
                    imageUrl:
                        '${dotenv.env['API_URL']}/static/${exercise.photos[0].photoUrl}',
                    width: 50,
                    height: 50,
                  )
                : const Icon(CupertinoIcons.photo, size: 50),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exercise.name,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(exercise.muscles.map((e) => e.name).join(", "),
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                              fontSize: 14, color: CupertinoColors.systemGrey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
