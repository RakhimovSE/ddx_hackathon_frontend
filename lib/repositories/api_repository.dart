import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/training_plan.dart';

class ApiRepository {
  // TODO Replace domain with environment variable
  final String baseUrl = 'http://localhost:8080';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<TrainingPlan>> fetchTrainingPlans() async {
    final response = await http.get(Uri.parse('$baseUrl/training_plans'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((plan) => TrainingPlan.fromJson(plan)).toList();
    } else {
      throw Exception('Failed to load training plans');
    }
  }
}
