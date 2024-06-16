import 'package:flutter/cupertino.dart';
import '../data/models/user.dart';
import 'main/main_screen.dart';
import 'trainers/trainer_screen.dart';
import 'exercise_list_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final User userData;

  const HomeScreen({super.key, required this.userData});

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
            icon: Icon(CupertinoIcons.person_2_fill),
            label: 'Тренеры',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet),
            label: 'Упражнения',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Профиль',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => const MainScreen(),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => const TrainerScreen(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const ExerciseListScreen(),
            );
          case 3:
            return CupertinoTabView(
              builder: (context) => ProfileScreen(userData: userData),
            );
          default:
            return CupertinoTabView(
              builder: (context) => const MainScreen(),
            );
        }
      },
    );
  }
}
