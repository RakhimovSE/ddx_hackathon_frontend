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
          StoryWidget(name: 'Rudy Fernandez', role: 'Manager', imageUrl: ''),
          StoryWidget(name: 'Abigail Herrara', role: 'Designer', imageUrl: ''),
          StoryWidget(name: 'Liz Ambridge', role: 'Manager', imageUrl: ''),
          StoryWidget(
            name: 'John Smith',
            role: 'Developer',
            imageUrl: '',
          ),
          StoryWidget(
            name: 'Emily Johnson',
            role: 'Tester',
            imageUrl: '',
          ),
          StoryWidget(
            name: 'Michael Davis',
            role: 'Product Manager',
            imageUrl: '',
          ),
        ],
      ),
    );
  }
}
