import 'package:flutter/material.dart';

class NavigatorV1ScreenA extends StatelessWidget {
  const NavigatorV1ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator V1 Screen A'),
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
