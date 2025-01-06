import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/plant_model.dart';

class ApiService {
  Future<List<Plant>> fetchPlants() async {
    final response = await http.get(Uri.parse('https://api.example.com/plants'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((json) => Plant.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load plants');
    }
  }
}
