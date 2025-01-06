import 'package:flutter/material.dart';
import '../../domain/entities/user_entity.dart';

class UserInfoCard extends StatelessWidget {
  final UserEntity user;

  UserInfoCard(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
      ),
    );
  }
}
