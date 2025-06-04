import 'package:cardiweb/constructors.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.nickName),
      subtitle: Text('${user.age} ans'),
    );
  }
}
