import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/trainer_card.dart';
import '../widgets/stories_list.dart';
import '../widgets/trainer_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> logout(BuildContext context) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Тренерский состав'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.power),
          onPressed: () {
            logout(context);
          },
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TrainerCard(
                name: 'Алина Колебанова',
                specialty: 'Йога, похудение',
                imageUrl: 'https://example.com/alina.jpg',
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Истории',
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                ),
              ),
              const SizedBox(height: 16),
              const StoriesList(),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CupertinoSearchTextField(
                  placeholder: 'Search for your shoes...',
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TrainerList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
