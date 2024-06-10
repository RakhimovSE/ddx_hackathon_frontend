import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

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
            _buildUserInfo(),
            const SizedBox(height: 20),
            _buildListTile(
              context,
              CupertinoIcons.chart_bar,
              'Статистика',
              () {
                // Handle Statistica tap
              },
            ),
            _buildListTile(
              context,
              CupertinoIcons.chart_bar_square,
              'Изометрия',
              () {
                // Handle Izometriya tap
              },
            ),
            _buildSectionHeader(''),
            _buildListTile(
              context,
              CupertinoIcons.person,
              'Данные пользователя',
              () {
                // Handle User Data tap
              },
            ),
            _buildListTile(
              context,
              CupertinoIcons.settings,
              'Настройки приложения',
              () {
                // Handle App Settings tap
              },
            ),
            _buildListTile(
              context,
              CupertinoIcons.creditcard,
              'Платежные данные',
              () {
                // Handle Payment Data tap
              },
            ),
            _buildListTile(
              context,
              CupertinoIcons.chat_bubble,
              'Саппорт',
              () {
                // Handle Support tap
              },
            ),
            _buildListTile(
              context,
              CupertinoIcons.square_arrow_left,
              'Выход пользователя',
              () => logout(context),
              textColor: CupertinoColors.destructiveRed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:
                userData.avatarUrl != null && userData.avatarUrl!.isNotEmpty
                    ? NetworkImage(userData.avatarUrl!)
                    : null,
            child: userData.avatarUrl == null || userData.avatarUrl!.isEmpty
                ? const Icon(
                    CupertinoIcons.person,
                    size: 40,
                    color: CupertinoColors.white,
                  )
                : null,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userData.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                userData.email,
                style: const TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: CupertinoColors.systemGrey,
        ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color? textColor,
  }) {
    return CupertinoListTile(
      leading: Icon(icon, color: textColor ?? CupertinoColors.systemGrey),
      title: Text(title, style: TextStyle(color: textColor)),
      trailing: const CupertinoListTileChevron(),
      onTap: onTap,
    );
  }
}

class CupertinoListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const CupertinoListTile({
    required this.leading,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: CupertinoColors.systemGrey5),
          ),
        ),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 16),
            Expanded(child: title),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

class CupertinoListTileChevron extends StatelessWidget {
  const CupertinoListTileChevron();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      CupertinoIcons.forward,
      color: CupertinoColors.systemGrey,
    );
  }
}
