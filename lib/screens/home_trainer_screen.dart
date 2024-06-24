import 'package:flutter/cupertino.dart';
import '../data/models/user.dart';
import 'main/main_client_screen.dart';
import 'profile_screen.dart';
import 'exercise_list_screen.dart';
import 'client_list_screen.dart';

class HomeTrainerScreen extends StatelessWidget {
  final User userData;

  const HomeTrainerScreen({super.key, required this.userData});

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
            label: 'Клиенты',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.sportscourt),
            label: 'Упражнения',
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
              builder: (context) => const ClientListScreen(),
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
              builder: (context) => const MainClientScreen(),
            );
        }
      },
    );
  }
}
