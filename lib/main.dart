import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/client_trainer_bloc.dart';
import 'bloc/trainer_bloc.dart';
import 'env_config.dart';
import 'repositories/api_repository.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/profile_screen.dart';
import 'models/user.dart';
import 'dart:convert';

Future<void> main() async {
  await EnvConfig.load();
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final String? userJson = prefs.getString('user');
  final bool isLoggedIn = userJson != null;
  User? userData;
  if (isLoggedIn) {
    final Map<String, dynamic> userMap = jsonDecode(userJson);
    userData = User.fromJson(userMap);
  }

  runApp(DDXApp(isLoggedIn: isLoggedIn, userData: userData));
}

class DDXApp extends StatelessWidget {
  final bool isLoggedIn;
  final User? userData;

  const DDXApp({super.key, required this.isLoggedIn, this.userData});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TrainerBloc(apiRepository: ApiRepository()),
        ),
        BlocProvider(
          create: (context) =>
              ClientTrainerBloc(apiRepository: ApiRepository()),
        ),
      ],
      child: CupertinoApp(
        title: 'DDX Hackathon',
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.systemBlue,
        ),
        home:
            isLoggedIn ? HomeScreen(userData: userData!) : const LoginScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/registration': (context) => const RegistrationScreen(),
          '/home': (context) => HomeScreen(userData: userData!),
          '/profile': (context) => ProfileScreen(userData: userData!),
        },
      ),
    );
  }
}
