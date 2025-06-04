import 'package:cardiweb/lists/lists_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListsScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontSize: 42,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
