import 'package:bloom_app/app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_profile_viewmodel.dart';
import '../components/user_info_card.dart';

class UserProfileScreen extends StatelessWidget {
  final String userId;

  UserProfileScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserProfileViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: viewModel.isLoading
          ? LoadingIndicator()
          : viewModel.user != null
          ? UserInfoCard(viewModel.user!)
          : Center(child: Text('No user data found')),
    );
  }
}
