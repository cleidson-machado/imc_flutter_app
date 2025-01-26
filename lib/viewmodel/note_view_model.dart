// ignore_for_file: prefer_final_fields, unused_local_variable
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/model/note_model.dart';
import 'package:http/http.dart' as http;

class NoteViewModel with ChangeNotifier {
  List<NoteModel> _notes = [];
  bool _loading = false;
  String _errorMessage = '';

  List<NoteModel> get notes => _notes;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  Future<void> fetchNotes() async {
    _loading = true;
    _errorMessage = ''; // Clear any previous errors
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://6767d711c1de2e6421c86392.mockapi.io/api/v1/notes/'),
      );

      if (response.statusCode == 200) {
        _notes = (json.decode(response.body) as List)
            .map((note) => NoteModel.fromjson(note as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to fetch notes. Status code: ${response.statusCode}');
      }
    } catch (e) {
      _errorMessage = 'Error: $e'; // Set the error message
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

