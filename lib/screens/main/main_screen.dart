import 'package:flutter/cupertino.dart';
import 'training_plans_section.dart';
import 'weekly_trainings_section.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Тренировки'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrainingPlansSection(),
              WeeklyTrainingsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
