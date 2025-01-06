import 'package:flutter/material.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use_cases/get_user_profile.dart';

class UserProfileViewModel extends ChangeNotifier {
  final GetUserProfile getUserProfileUseCase;

  UserProfileViewModel(this.getUserProfileUseCase);

  UserEntity? user;
  bool isLoading = false;

  Future<void> loadUserProfile(String userId) async {
    isLoading = true;
    notifyListeners();

    user = await getUserProfileUseCase(userId);

    isLoading = false;
    notifyListeners();
  }
}
