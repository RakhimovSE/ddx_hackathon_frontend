import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    final response = await http.post(
      // TODO Replace domain with environment variable
      Uri.parse('http://localhost:8080/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      print('Registration successful: $user');
      // Перейдите на другой экран или выполните другие действия после успешной регистрации
    } else {
      print('Registration failed: ${response.body}');
      // Покажите сообщение об ошибке пользователю
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Register'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                controller: _nameController,
                placeholder: 'Name',
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              const SizedBox(height: 16),
              CupertinoTextField(
                controller: _emailController,
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              const SizedBox(height: 16),
              CupertinoTextField(
                controller: _passwordController,
                placeholder: 'Password',
                obscureText: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              const SizedBox(height: 24),
              CupertinoButton.filled(
                onPressed: _register,
                child: const Text('Register'),
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
