import 'package:bloom_app/data/models/user_model.dart';
import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  final UserModel? user;

  const UserInfoCard(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user?.id ?? ""),
        subtitle: Text(user?.email ?? ""),
      ),
    );
  }
}
