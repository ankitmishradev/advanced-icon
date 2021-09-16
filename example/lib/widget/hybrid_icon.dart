import 'package:flutter/material.dart';
import 'package:advanced_icon/advanced_icon.dart';

import 'section.dart';

class HybridIconContainer extends StatefulWidget {
  const HybridIconContainer({
    Key? key,
    required this.icon,
    required this.secondaryIcon,
    required this.caption,
    this.gradient,
    this.effect = AdvancedIconEffect.bubble,
    this.color,
    this.secondaryColor,
  }) : super(key: key);

  final IconData icon;
  final IconData secondaryIcon;
  final String caption;
  final Gradient? gradient;
  final Color? color;
  final Color? secondaryColor;
  final AdvancedIconEffect effect;

  @override
  State<HybridIconContainer> createState() => _HybridIconContainerState();
}

class _HybridIconContainerState extends State<HybridIconContainer> {
  late AdvancedIconState _state;

  @override
  void initState() {
    _state = AdvancedIconState.primary;
    super.initState();
  }

  void _onChanged() {
    setState(() {
      switch (_state) {
        case AdvancedIconState.primary:
          _state = AdvancedIconState.secondary;
          break;
        case AdvancedIconState.secondary:
          _state = AdvancedIconState.primary;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      body: Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onTap: _onChanged,
          child: AdvancedIcon(
            icon: widget.icon,
            secondaryIcon: widget.secondaryIcon,
            state: _state,
            gradient: widget.gradient,
            color: widget.color,
            secondaryColor: widget.secondaryColor,
            effect: widget.effect,
            size: 56,
          ),
        ),
      ),
      caption: widget.caption,
    );
  }
}
