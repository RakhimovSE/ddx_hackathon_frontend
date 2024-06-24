import 'package:flutter/cupertino.dart';

class TagWidget extends StatelessWidget {
  final String tag;
  final Color color;

  const TagWidget({
    required this.tag,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        tag,
        style: TextStyle(color: color),
      ),
    );
  }
}
