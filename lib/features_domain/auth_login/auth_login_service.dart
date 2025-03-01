import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:my_imc_calc_app/core/useful/service_data_exception.dart';
import 'auth_login_model.dart';
import 'package:my_imc_calc_app/core/useful/error_messages.dart';

final String? apiUrl = dotenv.env['MOC_API_A'];

class AuthLoginService {
  final Logger _logger = Logger();

  Future<List<AuthLoginModel>> fetchUsersBasicWay() async {
    if (apiUrl == null) {
      throw ServiceDataException.handler(ErrorMessages.apiUrlNotSet);
    }
    final result = await Dio().get('$apiUrl/user/');

    if (result.statusCode == 200) {
      List<dynamic> data = result.data; 
      return data.map((user) => AuthLoginModel.fromMap(user)).toList();
    } else {
      throw ServiceDataException.handler(ErrorMessages.failedToLoadUsers);
    }
  }

  Future<List<AuthLoginModel>> fetchUsers() async {
    await Future.delayed(
        const Duration(seconds: 5)); // Simulate a 5-second delay

    try {
      if (apiUrl == null) {
        throw ServiceDataException.handler(ErrorMessages.apiUrlNotSet);
      }

      final result = await Dio().get('$apiUrl/user/');
      if (result.statusCode == 200) {
        List<dynamic> data = result.data;
        return data.map((user) => AuthLoginModel.fromMap(user)).toList();
      } else {
        throw ServiceDataException.handler(ErrorMessages.failedToLoadUsers);
      }
    } catch (e) {
      _logger.e('Error fetching users', error: e);
      throw ServiceDataException.handler(
          '${ErrorMessages.errorFetchingUsers}: $e');
    }
  }
}
