import 'package:flutter/material.dart';
import 'package:advanced_icon/advanced_icon.dart';

import 'widget/hybrid_icon.dart';

const double _sectionHeight = 136.0;

class AnimationDemoScreen extends StatelessWidget {
  const AnimationDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: [
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
            const HybridIconContainer(
              icon: Icons.star_border_rounded,
              secondaryIcon: Icons.star_rounded,
              caption: 'Spin',
              effect: AdvancedIconEffect.spin,
              color: Colors.green,
              secondaryColor: Colors.indigo,
            ),
            HybridIconContainer(
              icon: Icons.check_box_outline_blank_rounded,
              secondaryIcon: Icons.check_box_rounded,
              caption: 'Bubble',
              effect: AdvancedIconEffect.bubble,
              gradient: RadialGradient(
                center: Alignment.center,
                stops: const [0.2, 0.8],
                colors: [Colors.blue[400]!, Colors.blue[900]!],
              ),
            ),
            HybridIconContainer(
              icon: Icons.view_agenda_outlined,
              secondaryIcon: Icons.grid_view,
              caption: 'Fade',
              effect: AdvancedIconEffect.fade,
              color: Colors.grey[800],
            ),
            HybridIconContainer(
              icon: Icons.first_page_rounded,
              secondaryIcon: Icons.last_page_rounded,
              caption: 'Horizontal Flip',
              effect: AdvancedIconEffect.flipH,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[900]!, Colors.red],
              ),
            ),
            HybridIconContainer(
              icon: Icons.thumb_up_outlined,
              secondaryIcon: Icons.thumb_down_outlined,
              caption: 'Vertical Flip',
              effect: AdvancedIconEffect.flipV,
              color: Colors.blue[800],
              secondaryColor: Colors.red,
            ),
            const HybridIconContainer(
              icon: Icons.add,
              secondaryIcon: Icons.check,
              caption: 'Spin Bubble',
              effect: AdvancedIconEffect.spinBubble,
              color: Colors.blue,
              secondaryColor: Colors.green,
            ),
            HybridIconContainer(
              icon: Icons.play_arrow_rounded,
              secondaryIcon: Icons.pause_rounded,
              caption: 'Bubble Fade',
              effect: AdvancedIconEffect.bubbleFade,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.red[700]!, Colors.yellow],
              ),
            ),
            const HybridIconContainer(
              icon: Icons.search_rounded,
              secondaryIcon: Icons.clear_rounded,
              caption: 'No effect',
              effect: AdvancedIconEffect.none,
              secondaryColor: Colors.red,
            ),
          ],
        ),
      ],
    );
  }
}
