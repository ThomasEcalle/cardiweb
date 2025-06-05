import 'package:cardiweb/navigator_v1_examples/screen_c_parameters.dart';
import 'package:flutter/material.dart';

class NavigatorV1ScreenC extends StatelessWidget {
  static const String routeName = '/screenC';

  const NavigatorV1ScreenC({
    super.key,
    required this.parameters,
  });

  final ScreenCParameters parameters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator V1 Screen C'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This is Screen C with ID: ${parameters.id}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
