import 'package:flutter/material.dart';

import 'animation_demo_screen.dart';
import 'decoration_demo_screen.dart';

class HomeScreen extends StatelessWidget {
  ///Home screen of the app.
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Advanced Icon'),
          bottom: const TabBar(
            tabs: [Tab(text: 'Icon Transition'), Tab(text: 'Icon Decoration')],
          ),
        ),
        body: const TabBarView(children: [
          AnimationDemoScreen(),
          DecorationDemoScreen(),
        ]),
      ),
    );
  }
}
