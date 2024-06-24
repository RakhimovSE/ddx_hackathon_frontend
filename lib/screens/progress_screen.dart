import 'package:flutter/cupertino.dart';
import '../widgets/progress_card.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Прогресс'),
        previousPageTitle: 'Назад',
      ),
      child: Column(
        children: [
          CupertinoSegmentedControl<int>(
            padding: const EdgeInsets.all(16),
            groupValue: 0,
            children: const <int, Widget>{
              0: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Достижения'),
              ),
              1: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Тело'),
              ),
            },
            onValueChanged: (int value) {
              // Handle segment change if needed
            },
          ),
          Expanded(
            child: CupertinoTabView(
              builder: (context) {
                return CupertinoTabScaffold(
                  tabBar: CupertinoTabBar(
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.star_fill),
                        label: 'Достижения',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.person_fill),
                        label: 'Тело',
                      ),
                    ],
                  ),
                  tabBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return _buildAchievements();
                      case 1:
                        return _buildBodyProgress();
                      default:
                        return _buildAchievements();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievements() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: const [
          ProgressCard(
            title: 'calories burned',
            value: '1,592',
            unit: 'Kcal',
          ),
          ProgressCard(
            title: 'completed workouts',
            value: '128',
          ),
          ProgressCard(
            title: 'max month streak',
            value: '16',
          ),
          ProgressCard(
            title: 'completed workouts',
            value: '128',
          ),
          ProgressCard(
            title: 'calories burned',
            value: '1,592',
            unit: 'Kcal',
          ),
          ProgressCard(
            title: 'completed workouts',
            value: '128',
          ),
        ],
      ),
    );
  }

  Widget _buildBodyProgress() {
    // Here you can add widgets for body progress similar to achievements
    return const Center(child: Text('Тело')); // Placeholder for Body progress
  }
}
