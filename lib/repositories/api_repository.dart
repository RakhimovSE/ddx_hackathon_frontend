import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/training_plan.dart';
import '../models/exercise.dart';

class ApiRepository {
  final String baseUrl = dotenv.env['API_URL']!;

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

  Future<List<Exercise>> fetchExercises(
      {int offset = 0, int limit = 20}) async {
    final response = await http
        .get(Uri.parse('$baseUrl/exercises?offset=$offset&limit=$limit'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((exercise) => Exercise.fromJson(exercise))
          .toList();
    } else {
      throw Exception('Failed to load exercises');
    }
  }

  Future<List<User>> fetchTrainersForClient(int clientId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/clients/$clientId/trainers'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load trainers');
    }
  }
}
