import 'package:flutter/cupertino.dart';
import '../data/models/user.dart';
import 'main/main_client_screen.dart';
import 'trainers/trainer_screen.dart';
import 'progress_screen.dart';
import 'profile_screen.dart';

class HomeClientScreen extends StatelessWidget {
  final User userData;

  const HomeClientScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: 'Тренеры',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chart_bar),
            label: 'Прогресс',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Настройки',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => const MainClientScreen(),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => const TrainerScreen(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const ProgressScreen(),
            );
          case 3:
            return CupertinoTabView(
              builder: (context) => ProfileScreen(userData: userData),
            );
          default:
            return CupertinoTabView(
              builder: (context) => const MainClientScreen(),
            );
        }
      },
    );
  }
}
