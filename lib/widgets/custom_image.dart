import 'package:flutter/cupertino.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    required this.imageUrl,
    required this.width,
    required this.height,
    super.key,
  });

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: CupertinoColors.systemGrey,
          child: const Icon(CupertinoIcons.person,
              size: 40, color: CupertinoColors.white),
        );
      },
    );
  }
}
