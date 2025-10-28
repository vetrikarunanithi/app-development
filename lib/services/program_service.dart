import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/program.dart';

class ProgramService {
  static Future<List<Program>> loadPrograms() async {
    try {
      final dataString = await rootBundle.loadString('assets/data/programs.json');
      final List<dynamic> jsonList = json.decode(dataString);
      return jsonList.map((json) => Program.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load programs: $e');
    }
  }

  static Future<Program?> getProgramById(String id) async {
    final programs = await loadPrograms();
    try {
      return programs.firstWhere((p) => p.id == id);
    } catch (e) {
      // If not found, return null
      return null;
    }
  }
}
