import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/profile_screen.dart';
import 'models/user.dart';
import 'dart:convert';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
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
    return CupertinoApp(
      title: 'DDX Hackathon',
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: isLoggedIn ? HomeScreen(userData: userData!) : const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/home': (context) => HomeScreen(userData: userData!),
        '/profile': (context) => ProfileScreen(userData: userData!),
      },
    );
  }
}
