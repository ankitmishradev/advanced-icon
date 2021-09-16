import 'package:flutter/material.dart';
import 'package:advanced_icon/advanced_icon.dart';

import 'widget/heading.dart';
import 'widget/section.dart';
import 'widget/caption.dart';

const double _sectionHeight = 136.0;
const double _iconSize = 56;

class DecorationDemoScreen extends StatelessWidget {
  const DecorationDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: [
        const Heading('Decorating icons with gradient'),
        const Caption(
            'Using ADVACNED ICON package flutter developers can decorate icons in the app with COLOR and GRADIENT to make icons look more appealing. The icons with gradient enhances the user experience of the app.'),
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: _sectionHeight,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          children: [
            const Section(
              body: AdvancedIcon(
                icon: Icons.home,
                size: _iconSize,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 0.8],
                  colors: [Colors.cyan, Colors.deepPurple],
                ),
              ),
            ),
            Section(
              body: AdvancedIcon(
                icon: Icons.favorite,
                size: _iconSize,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  stops: const [0.6, 0.8],
                  colors: [Colors.red[700]!, Colors.yellow],
                ),
              ),
            ),
            const Section(
              body: AdvancedIcon(
                icon: Icons.pets,
                size: _iconSize,
                gradient: RadialGradient(
                  center: Alignment.center,
                  stops: [0.2, 0.9],
                  colors: [Colors.orange, Colors.brown],
                ),
              ),
            ),
            Section(
              body: AdvancedIcon(
                icon: Icons.account_balance_rounded,
                size: _iconSize,
                gradient: RadialGradient(
                  center: Alignment.center,
                  stops: const [0.2, 0.9],
                  colors: [Colors.blue[600]!, Colors.purple[800]!],
                ),
              ),
            ),
            const Section(
              body: AdvancedIcon(
                icon: Icons.lightbulb_outline_rounded,
                size: _iconSize,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 0.8],
                  colors: [Colors.pink, Colors.orange],
                ),
              ),
            ),
            Section(
              body: AdvancedIcon(
                icon: Icons.spa_outlined,
                size: _iconSize,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  stops: const [0.6, 0.8],
                  colors: [Colors.blue, Colors.purple[700]!],
                ),
              ),
            ),
            Section(
              body: AdvancedIcon(
                icon: Icons.view_in_ar_outlined,
                size: _iconSize,
                gradient: RadialGradient(
                  center: Alignment.center,
                  stops: const [0.2, 0.9],
                  colors: [Colors.blue[600]!, Colors.purple[800]!],
                ),
              ),
            ),
            const Section(
              body: AdvancedIcon(
                icon: Icons.local_shipping_outlined,
                size: _iconSize,
                gradient: RadialGradient(
                  center: Alignment.center,
                  stops: [0.2, 0.9],
                  colors: [Colors.orange, Colors.brown],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
