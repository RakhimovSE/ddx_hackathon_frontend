import 'package:flutter/cupertino.dart';
import 'dashboard_screen.dart';
import 'exercise_list_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              builder: (context) => const ProfileScreen(),
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
