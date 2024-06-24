import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/user.dart';
import '../widgets/profile/profile_section_header.dart';
import '../widgets/profile/profile_list_tile.dart';
import '../widgets/user/user_info.dart';

class ProfileScreen extends StatelessWidget {
  final User userData;

  const ProfileScreen({super.key, required this.userData});

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    if (!context.mounted) return;
    Navigator.of(context, rootNavigator: true)
        .pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Profile'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            UserInfo(userData: userData),
            const SizedBox(height: 20),
            const ProfileSectionHeader(title: 'Аккаунт'),
            ProfileListTile(
              icon: CupertinoIcons.chart_bar,
              title: 'Статистика',
              onTap: () {
                // Handle Statistica tap
              },
            ),
            ProfileListTile(
              icon: CupertinoIcons.chart_bar_square,
              title: 'Изометрия',
              onTap: () {
                // Handle Izometriya tap
              },
            ),
            const ProfileSectionHeader(title: 'Основное'),
            ProfileListTile(
              icon: CupertinoIcons.person,
              title: 'Данные пользователя',
              onTap: () {
                // Handle User Data tap
              },
            ),
            ProfileListTile(
              icon: CupertinoIcons.settings,
              title: 'Настройки приложения',
              onTap: () {
                // Handle App Settings tap
              },
            ),
            ProfileListTile(
              icon: CupertinoIcons.creditcard,
              title: 'Платежные данные',
              onTap: () {
                // Handle Payment Data tap
              },
            ),
            ProfileListTile(
              icon: CupertinoIcons.chat_bubble,
              title: 'Саппорт',
              onTap: () {
                // Handle Support tap
              },
            ),
            ProfileListTile(
              icon: CupertinoIcons.square_arrow_left,
              title: 'Выход пользователя',
              onTap: () => logout(context),
              textColor: CupertinoColors.destructiveRed,
            ),
          ],
        ),
      ),
    );
  }
}
