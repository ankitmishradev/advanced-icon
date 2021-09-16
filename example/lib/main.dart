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
        primarySwatch: Colors.teal,
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
