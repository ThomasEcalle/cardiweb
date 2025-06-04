import 'package:cardiweb/constructors.dart';
import 'package:cardiweb/layouts/red_circle.dart';
import 'package:flutter/material.dart';

class ListsScreen extends StatelessWidget {
  ListsScreen({super.key});

  final _users = List.generate(100, (index) {
    return User('Nick $index', age: index);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: _users.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(height: 20, width: 20),
        itemBuilder: (context, index) {
          if (index.isEven) return const Offstage();
          return RedCircle(index: index);
        },
      ),
    );
  }
}
