// ignore_for_file: prefer_final_fields, unused_local_variable
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/model/note_model.dart';
import 'package:http/http.dart' as http;

class NoteViewModel with ChangeNotifier {
  List<NoteModel> _notes = [];
  bool _loading = false;

  List<NoteModel> get notes => _notes;
  bool get loading => _loading;

  Future<void> fetchNotes() async {
    _loading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://6767d711c1de2e6421c86392.mockapi.io/api/v1/notes/')
      );

        if(response.statusCode == 200){
          List<NoteModel> fetchNotes = (json.decode(response.body) as List)
          .map((note) => NoteModel.fromjson(note)).toList();
        }
        _notes = fetchNotes as List<NoteModel>;

    } catch (e) {
      throw Exception('Failed to Load data');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
