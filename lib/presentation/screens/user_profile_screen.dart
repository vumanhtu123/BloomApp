import 'package:bloom_app/app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_profile_viewmodel.dart';
import '../components/user_info_card.dart';

class UserProfileScreen extends StatefulWidget {
  final String userId;

  const UserProfileScreen({super.key, required this.userId});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Đảm bảo fetchUsers() được gọi sau khi build context đã được khởi tạo đầy đủ.
    // Tránh lỗi khi sử dụng Provider trong initState.
    // listen: Điều này giúp tránh rebuild widget không cần thiết
    Future.microtask(
        () => Provider.of<UserViewModel>(context, listen: false).fetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: AppBar(title: const Text('User Profile')),
        body: viewModel.isLoading
            ? const LoadingIndicator()
            : viewModel.error != null
                ? Text(viewModel.error ?? " ")
                : ListView.builder(
                    itemCount: viewModel.users.length,
                    itemBuilder: (context, index) {
                      final user = viewModel.users[index];
                      return UserInfoCard(user);
                    },
                  ));
  }
}
