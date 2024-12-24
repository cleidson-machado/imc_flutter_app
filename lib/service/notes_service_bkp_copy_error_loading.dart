// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings, unused_local_variable
import 'dart:convert';
import 'package:my_imc_calc_app/Model/note_entity.dart';
import 'package:my_imc_calc_app/Model_API_generics/api_response_generic.dart';
import 'package:http/http.dart' as http;
// import 'package:my_imc_calc_app/pages/a_rest_api_basic_%20consuming/note_list_page.dart';

class NotesServiceErrorNoLoadingNotyhing {
  static const API = 'https://6767d711c1de2e6421c86392.mockapi.io/api/v1';
  
  get notes => [];

  Future<ApiResponseGeneric<List<NoteEntity>>> getNotesList() async {

    return http.get((API + '/notes') as Uri, headers: null)
    .then((data) {
      if(data.statusCode == 200){
        
        final jsonData = json.decode(data.body);
        final notes = <NoteEntity>[];

          for (var item in jsonData){
            final note = NoteEntity(
              noteID: item['noteID'],
              noteTitle: item['noteTitle'], 
              createDateTime: DateTime.parse(item['createDateTime']),
              latestEditDateTime: DateTime.parse(item['latestEditDateTime']), //THE ERROR IS HERE!!???
            );
            notes.add(note);
          }

        return ApiResponseGeneric<List<NoteEntity>>(data: notes);
      }
      return ApiResponseGeneric<List<NoteEntity>>(error: true, errorMessage: 'An Error Occured 1');
    })
    .catchError((_) => ApiResponseGeneric<List<NoteEntity>>(data: notes, error: true, errorMessage: 'An Error Occured 2')); 
  }

}