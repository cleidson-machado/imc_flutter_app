import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'auth_login_model.dart';

// Custom exception class
class FetchDataException implements Exception {
  final String message;
  FetchDataException(this.message);

  @override
  String toString() => 'FetchDataException: $message';
}

class AuthLoginService {
  final String _baseUrl = 'https://6767d711c1de2e6421c86392.mockapi.io/api/v1/user/';
  final Logger _logger = Logger();

  Future<List<AuthLoginModel>> fetchUsersBasicWay() async {
    await Future.delayed(const Duration(seconds: 2)); // Simula um delay de 2 segundos
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((user) => AuthLoginModel.fromMap(user)).toList();
    } else {
      throw FetchDataException('Failed to load users');
    }
  }

  Future<List<AuthLoginModel>> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 5)); // Simula um delay de 5 segundos

    try {
      final apiUrl = dotenv.env['MOC_API_A'];
      if (apiUrl == null) {
        throw FetchDataException('API URL is not set in environment variables');
      }

      final response = await Dio().get('$apiUrl/user/');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((user) => AuthLoginModel.fromMap(user)).toList();
      } else {
        throw FetchDataException('Failed to load users');
      }
    } catch (e) {
      _logger.e('Error fetching users', error: e);
      throw FetchDataException('Error fetching users: $e');
    }
  }
}
