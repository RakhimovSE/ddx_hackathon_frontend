import 'package:flutter/cupertino.dart';
import '../widgets/progress_card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Прогресс'),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  color: _selectedIndex == 0
                      ? CupertinoColors.activeBlue
                      : CupertinoColors.systemGrey,
                  borderRadius: BorderRadius.circular(8.0),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: const Text('Достижения'),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  color: _selectedIndex == 1
                      ? CupertinoColors.activeBlue
                      : CupertinoColors.systemGrey,
                  borderRadius: BorderRadius.circular(8.0),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: const Text('Тело'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _selectedIndex == 0
                ? _buildAchievements()
                : _buildBodyProgress(),
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
        children: [
          ProgressCard(
            title: 'calories burned',
            value: '1,592',
            unit: 'Kcal',
            onTap: () {},
          ),
          ProgressCard(
            title: 'completed workouts',
            value: '128',
            unit: '',
            onTap: () {},
          ),
          ProgressCard(
            title: 'max month streak',
            value: '16',
            unit: '',
            onTap: () {},
          ),
          ProgressCard(
            title: 'completed workouts',
            value: '128',
            unit: '',
            onTap: () {},
          ),
          ProgressCard(
            title: 'calories burned',
            value: '1,592',
            unit: 'Kcal',
            onTap: () {},
          ),
          ProgressCard(
            title: 'completed workouts',
            value: '128',
            unit: '',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBodyProgress() {
    return const Center(child: Text('Тело')); // Placeholder for Body progress
  }
}
