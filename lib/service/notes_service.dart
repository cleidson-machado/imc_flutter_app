// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings, unused_local_variable, avoid_print
import 'dart:convert';
import 'package:my_imc_calc_app/Model/note_entity.dart';
import 'package:my_imc_calc_app/Model_API_generics/api_response_generic.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'https://6767d711c1de2e6421c86392.mockapi.io/api/v1';

  Future<ApiResponseGeneric<List<NoteEntity>>> getNotesList() async {
    try {
      final response = await http.get(Uri.parse(API + '/notes'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<NoteEntity> result = jsonData
            .map<NoteEntity>((item) {
              return NoteEntity(
                noteID: item['noteID'],
                noteTitle: item['noteTitle'],
                createDateTime: DateTime.parse(item['createDateTime']),
                latestEditDateTime: DateTime.parse(item['latestEditDateTime']),
              );
            })
            .toList();

        return ApiResponseGeneric<List<NoteEntity>>(
          data: result,
          error: false,
          errorMessage: '',
        );
      } else {
        return ApiResponseGeneric<List<NoteEntity>>(
          data: [],
          error: true,
          errorMessage:
              'Failed to fetch notes. Status Code: ${response.statusCode}',
        );
      }
    } catch (error) {
      return ApiResponseGeneric<List<NoteEntity>>(
        data: [],
        error: true,
        errorMessage: 'Error on Service Class: $error',
      );
    }
  }
}
