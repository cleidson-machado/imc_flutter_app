// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings, unused_local_variable
import 'dart:convert';
import 'package:my_imc_calc_app/Model/note_entity.dart';
import 'package:my_imc_calc_app/Model_API_generics/api_response_generic.dart';
import 'package:http/http.dart' as http;

//THE ERRO HERE was BECAUSE THIS..
// return await http.get((API + '/notes') as Uri, headers: null)
// I NEED TO USING PARSE, like this bellow
// final response = await http.get(Uri.parse(API + '/notes'));

class NotesServiceAnotherWayTouse{
  static const API = 'https://6767d711c1de2e6421c86392.mockapi.io/api/v1';

  Future<ApiResponseGeneric<List<NoteEntity>>> getNotesList() async {
    return await http
        .get(Uri.parse(API + '/notes'), headers: null)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final result = <NoteEntity>[];

        for (var item in jsonData) {
          final note = NoteEntity(
            noteID: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            latestEditDateTime: DateTime.parse(
                item['latestEditDateTime']), //THE ERROR IS HERE!!???
          );
          result.add(note);
        }

        return ApiResponseGeneric<List<NoteEntity>>(
          data: result,
          error: false,
          errorMessage: '',
        );
      }
      return ApiResponseGeneric<List<NoteEntity>>(
        data: [],
        error: true,
        errorMessage: 'Failed to fetch notes. Status Code: ${data.statusCode}',
      );
    }).catchError((_) => ApiResponseGeneric<List<NoteEntity>>(
          data: [], 
          error: true, 
          errorMessage: 'An Error Occured!'),
    );
  }
}
