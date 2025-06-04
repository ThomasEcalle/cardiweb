import 'package:flutter/material.dart';

class RedCircle extends StatelessWidget {
  const RedCircle({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    print('Building red circle: $index');
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text('$index'),
      ),
    );
  }
}
