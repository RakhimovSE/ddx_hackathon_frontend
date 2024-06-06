import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    if (!context.mounted) return;
    Navigator.of(context, rootNavigator: true).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Профиль'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 16),
            _buildCard(context, 'Изменить данные', CupertinoIcons.pencil),
            _buildCard(
                context, 'Настройки приложения', CupertinoIcons.settings),
            _buildCard(context, 'Платежные данные', CupertinoIcons.creditcard),
            _buildCard(context, 'Саппорт', CupertinoIcons.question_circle),
            const SizedBox(height: 16),
            CupertinoButton.filled(
              onPressed: () => _logout(context),
              child: const Text('Выход'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              'https://example.com/profile.jpg'), // Замените на URL фотографии профиля
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Имя Пользователя',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'email@example.com',
              style: TextStyle(fontSize: 16, color: CupertinoColors.systemGrey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(title),
        onTap: () {
          // Обработка нажатия на карточку
        },
      ),
    );
  }
}
