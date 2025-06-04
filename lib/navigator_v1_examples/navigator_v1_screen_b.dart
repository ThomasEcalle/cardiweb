import 'package:flutter/material.dart';

class NavigatorV1ScreenB extends StatelessWidget {
  static const String routeName = '/screenB';

  const NavigatorV1ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator V1 Screen B'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Go back'),
          ),
        ),
      ),
    );
  }
}
