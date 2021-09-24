import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Flutter Icon',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF161B22),
        scaffoldBackgroundColor: const Color(0xFF212933),
        tabBarTheme: const TabBarTheme(
          unselectedLabelStyle: TextStyle(
            inherit: true,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          labelStyle: TextStyle(
            inherit: true,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
