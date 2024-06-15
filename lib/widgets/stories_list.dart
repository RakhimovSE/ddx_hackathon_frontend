import 'package:flutter/cupertino.dart';
import 'story_widget.dart';

class StoriesList extends StatelessWidget {
  const StoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          StoryWidget(
              name: 'Rudy Fernandez',
              role: 'Manager',
              imageUrl: 'https://example.com/rudy.jpg'),
          StoryWidget(
              name: 'Abigail Herrara',
              role: 'Designer',
              imageUrl: 'https://example.com/abigail.jpg'),
          StoryWidget(
              name: 'Liz Ambridge',
              role: 'Manager',
              imageUrl: 'https://example.com/liz.jpg'),
          StoryWidget(
            name: 'John Smith',
            role: 'Developer',
            imageUrl: 'https://example.com/john.jpg',
          ),
          StoryWidget(
            name: 'Emily Johnson',
            role: 'Tester',
            imageUrl: 'https://example.com/emily.jpg',
          ),
          StoryWidget(
            name: 'Michael Davis',
            role: 'Product Manager',
            imageUrl: 'https://example.com/michael.jpg',
          ),
        ],
      ),
    );
  }
}
