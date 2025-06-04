import 'package:flutter/material.dart';

class NavigatorV1ScreenD extends StatelessWidget {
  static const String routeName = '/screenD';

  static Future<String?> push(BuildContext context) {
    return Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (context) => const NavigatorV1ScreenD(),
      ),
    );
  }

  const NavigatorV1ScreenD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator V1 Screen D'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop('Hello');
            },
            child: const Text('Go back with result'),
          ),
        ),
      ),
    );
  }
}
