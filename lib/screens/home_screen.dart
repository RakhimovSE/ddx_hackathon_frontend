import 'package:flutter/cupertino.dart';
import 'trainer_screen.dart';
import 'exercise_list_screen.dart';
import 'profile_screen.dart';
import '../models/user.dart';

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
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => const DashboardScreen(),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => const ExerciseListScreen(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => ProfileScreen(userData: userData),
            );
          default:
            return CupertinoTabView(
              builder: (context) => const DashboardScreen(),
            );
        }
      },
    );
  }
}
