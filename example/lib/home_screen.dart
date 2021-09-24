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
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: const Text(
            'Advanced Icon',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white70,
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
