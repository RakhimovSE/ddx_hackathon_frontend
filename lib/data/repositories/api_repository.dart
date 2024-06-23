import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/client_exercise_set.dart';
import '../models/client_training_plan.dart';
import '../models/client_workout_exercise.dart';
import '../models/user.dart';
import '../models/training_plan.dart';
import '../models/exercise.dart';
import '../models/client_workout.dart';

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

  Future<List<User>> fetchTrainers() async {
    final response = await http.get(Uri.parse('$baseUrl/trainers'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load trainers');
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

  Future<List<ClientTrainingPlan>> fetchClientTrainingPlans(
      int clientId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/clients/$clientId/training_plans'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body
          .map((dynamic item) => ClientTrainingPlan.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load client training plans');
    }
  }

  Future<List<ClientWorkout>> fetchClientWorkouts(int clientId,
      {String? status, String? date}) async {
    String url = '$baseUrl/clients/$clientId/workouts';

    if (status != null) {
      url += '?status=$status';
    } else if (date != null) {
      url += '?date=$date';
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => ClientWorkout.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load client workouts');
    }
  }

  Future<List<ClientWorkout>> fetchClientWorkoutsByPlanId(
      int trainingPlanId) async {
    final response = await http
        .get(Uri.parse('$baseUrl/training_plans/$trainingPlanId/workouts'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((workout) => ClientWorkout.fromJson(workout))
          .toList();
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  Future<List<ClientWorkoutExercise>> fetchClientWorkoutExercises(
      int clientWorkoutId) async {
    final response = await http
        .get(Uri.parse('$baseUrl/client_workouts/$clientWorkoutId/exercises'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((exercise) => ClientWorkoutExercise.fromJson(exercise))
          .toList();
    } else {
      throw Exception('Failed to load client workout exercises');
    }
  }

  Future<List<ClientWorkoutExercise>> fetchClientCompletedExercises(
      int clientId, int exerciseId) async {
    final response = await http
        .get(Uri.parse('$baseUrl/clients/$clientId/exercise_sets/$exerciseId'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((exercise) => ClientWorkoutExercise.fromJson(exercise))
          .toList();
    } else {
      throw Exception('Failed to load client exercise sets');
    }
  }
}
