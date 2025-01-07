import 'package:bloom_app/data/models/user_model.dart';
import 'package:bloom_app/data/services/api_service.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  final ApiService _apiService;

  UserViewModel(this._apiService);

  // UserModel? _userModel;
  //
  // UserModel? get userModel => _userModel;

  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _error;

  String? get error => _error;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _users = await _apiService.fetchUsers();
    } catch (e) {
      _error = e.toString();
      throw e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
