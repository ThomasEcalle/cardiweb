import 'package:cardiweb/navigator_v1_examples/navigator_v1_home.dart';
import 'package:cardiweb/navigator_v1_examples/navigator_v1_screen_b.dart';
import 'package:cardiweb/navigator_v1_examples/page_not_found.dart';
import 'package:flutter/material.dart';

import 'navigator_v1_examples/navigator_v1_screen_c.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontSize: 42,
            color: Colors.pink,
          ),
        ),
      ),
      routes: {
        '/': (context) => const NavigatorV1Home(),
        NavigatorV1ScreenB.routeName: (context) => const NavigatorV1ScreenB(),
      },
      onGenerateRoute: (settings) {
        Widget screen = const PageNotFound();

        switch (settings.name) {
          case NavigatorV1ScreenC.routeName:
            final arguments = settings.arguments;
            if (arguments is String) {
              screen = NavigatorV1ScreenC(id: arguments);
            }
            break;
        }

        return MaterialPageRoute(builder: (context) => screen);
      },
    );
  }
}
