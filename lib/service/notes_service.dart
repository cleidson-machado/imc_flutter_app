
// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:my_imc_calc_app/Model/note_entity.dart';
import 'package:http/http.dart' as http;
import 'package:my_imc_calc_app/Model_API_generics/api_response_generic.dart';

// YOU'RE ALMOST THERE!! MAN!! NEVER GIVE UP!!

class NotesService {

  Future <ApiResponseGeneric<List<NoteEntity>>> getNotesList() async {

    final response = await http.get(Uri.parse('https://6767d711c1de2e6421c86392.mockapi.io/api/v1/notes'), headers: null);

    if(response.statusCode == 200){
      
      final List<NoteEntity> notes = [];
      final body = jsonDecode(response.body);

      print(body);

      body[''].map((item) {
        final NoteEntity noteEntity = NoteEntity.fromMap(item);
          notes.add(noteEntity);
      }).toList();

      return ApiResponseGeneric<List<NoteEntity>>(data: notes);
    } else if(response.statusCode == 404) {
      return ApiResponseGeneric<List<NoteEntity>>(error: true, errorMessage: 'An Error Occured 1');
    } else {
      return ApiResponseGeneric<List<NoteEntity>>(error: true, errorMessage: 'An Error Occured 2');
    }
    
  }

}