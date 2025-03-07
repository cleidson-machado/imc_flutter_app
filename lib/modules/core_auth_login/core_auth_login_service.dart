import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:my_imc_calc_app/util/service_data_exception.dart';
import 'core_auth_login_model.dart';
import 'package:my_imc_calc_app/util/error_messages.dart';

//REFATORAR CÓDIGO BASE USADO NA USER

final String? apiUrl = dotenv.env['MOC_API_A'];

class AuthLoginService {
  final Logger _logger = Logger();

  Future<List<AuthLoginModel>> fetchUsersBasicWay() async {
    if (apiUrl == null) {
      throw ServiceDataException.handler(ErrorMessages.API_URL_NOT_SET_MESSAGE);
    }
    final result = await Dio().get('$apiUrl/user/');

    if (result.statusCode == 200) {
      List<dynamic> data = result.data; 
      return data.map((user) => AuthLoginModel.fromMap(user)).toList();
    } else {
      throw ServiceDataException.handler(ErrorMessages.FAILED_TO_LOAD_USERS_MESSAGE);
    }
  }

  Future<List<AuthLoginModel>> fetchUsers() async {
    await Future.delayed(
        const Duration(seconds: 5)); // Simulate a 5-second delay

    try {
      if (apiUrl == null) {
        throw ServiceDataException.handler(ErrorMessages.API_URL_NOT_SET_MESSAGE);
      }

      final result = await Dio().get('$apiUrl/user/');
      if (result.statusCode == 200) {
        List<dynamic> data = result.data;
        return data.map((user) => AuthLoginModel.fromMap(user)).toList();
      } else {
        throw ServiceDataException.handler(ErrorMessages.FAILED_TO_LOAD_USERS_MESSAGE);
      }
    } catch (e) {
      _logger.e('Error fetching users', error: e);
      throw ServiceDataException.handler(
          '${ErrorMessages.ERROR_FETCHING_USERS_MESSAGE}: $e');
    }
  }
}
