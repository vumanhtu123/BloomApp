import 'package:riverpod/riverpod.dart';
import '../models/plant_model.dart';
import '../services/api_service.dart';

final plantProvider = FutureProvider<List<Plant>>((ref) async {
  return ApiService().fetchPlants();
});
