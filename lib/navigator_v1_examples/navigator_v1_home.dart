import 'package:cardiweb/navigator_v1_examples/navigator_v1_screen_b.dart';
import 'package:cardiweb/navigator_v1_examples/navigator_v1_screen_c.dart';
import 'package:cardiweb/navigator_v1_examples/screen_c_parameters.dart';
import 'package:flutter/material.dart';

import 'navigator_v1_screen_a.dart';
import 'navigator_v1_screen_d.dart';

class NavigatorV1Home extends StatelessWidget {
  const NavigatorV1Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _goToScreenA(context),
                child: const Text('Go to Screen A'),
              ),
              ElevatedButton(
                onPressed: () => _goToScreenB(context),
                child: const Text('Go to Screen B'),
              ),
              ElevatedButton(
                onPressed: () => _goToScreenC(context, '123'),
                child: const Text('Go to Screen C with ID 123'),
              ),
              ElevatedButton(
                onPressed: () => _goToScreenD(context),
                child: const Text('Go to Screen D'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToScreenA(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NavigatorV1ScreenA(),
      ),
    );
  }

  void _goToScreenB(BuildContext context) {
    Navigator.of(context).pushNamed(NavigatorV1ScreenB.routeName);
  }

  void _goToScreenC(BuildContext context, String id) {
    Navigator.of(context).pushNamed(
      NavigatorV1ScreenC.routeName,
      arguments: ScreenCParameters(id: id),
    );
  }

  void _goToScreenD(BuildContext context) async {
    final result = await NavigatorV1ScreenD.push(context);
    if (result == null) return;
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Result from Screen D: $result')),
    );
  }
}
