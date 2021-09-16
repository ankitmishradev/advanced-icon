import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'advanced_icon_enums.dart';
import 'advanced_icon_light.dart';
import 'advanced_icon_matrix.dart';

const double _pathFactor = 30.0;

class AdvancedIcon extends StatefulWidget {
  ///Creates an enhanced icon widget.
  ///
  ///If [icon] and [secondaryIcon] both are given, only one of them will render depending on the current state of the widget.
  ///Advanced icon use [AnimationController] and [Animation<double>] to create various animations effects to change the state of the widget smoothly.
  ///
  ///Advanced icon is smart enough to build the lightest widget tree possible for the given configuration without affecting the performance.
  ///
  ///For example:
  /// * Advanced icon uses [AnimationController] and [Animation] only when any [secondaryIcon] is availble and [effect] is not [AdvancedIconEffect.none].
  /// * Advanced icon does not use any opaque functionalities unless [opacity] is specified or [effect] includes one of the fading animations.
  /// * Advanced icon does not use [ShaderMask] to paint icons unless [gradient] is specified.
  ///
  ///See also:
  /// * [AdvancedIconLight], a lighter form of this widget.
  const AdvancedIcon({
    Key? key,
    required this.icon,
    this.secondaryIcon,
    this.size,
    this.gradient,
    this.color,
    this.secondaryColor,
    this.opacity,
    this.state = AdvancedIconState.primary,
    this.effect = AdvancedIconEffect.bubble,
    this.duration = const Duration(milliseconds: 300),
    this.semanticLabel,
    this.textDirection,
  })  : assert(opacity != null ? opacity >= 0.0 && opacity <= 1.0 : true),
        super(key: key);

  /// The icon to display.
  ///
  /// The icon can not be null. If [secondaryIcon] is specified along with the icon then the icon will be rendered only for [AdvancedIconState.primary].
  ///
  /// See also:
  /// * [AdvancedIconState], configures the state of the widget.
  final IconData icon;

  /// An optional icon to display along with [icon].
  ///
  /// This icon will only be rendered for [AdvancedIconState.secondary]. Secondary icon can be null, in which case the load of state changing and animation effects will not be added to the widget and only [icon] will be rendered hence it will make the widget lighter.
  ///
  /// See also:
  /// * [AdvancedIconLight], a lighter form of [AdvancedIcon].
  /// * [AdvancedIconState], configures the state of the widget.
  final IconData? secondaryIcon;

  /// The size of the icon in logical pixels.
  ///
  /// Icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the current [IconTheme] size, if any. If there is no
  /// [IconTheme], or it does not specify an explicit size, then it defaults to
  /// 24.0.
  ///
  /// If this [AdvancedIcon] is being placed inside an [IconButton], then use
  /// [IconButton.iconSize] instead, so that the [IconButton] can make the splash
  /// area the appropriate size as well. The [IconButton] uses an [IconTheme] to
  /// pass down the size to the [AdvancedIcon].
  ///
  /// * Both [icon] and [secondaryIcon](if not null) have the same size as mentioned above.
  final double? size;

  ///A gradient to use when filling the icon.
  ///
  /// If this is specified, [color] and [secondaryColor] has no effect.
  ///
  /// The [gradient] is drawn under the [AdvancedIcon].
  /// {@tool snippet}
  /// Typically, Material Design colors will be used to draw gradient, as follows:
  ///
  /// ```dart
  /// AdvancedIcon(
  ///   icon:Icons.home,
  ///   gradient:const RadialGradient(
  ///      colors: <Color>[Colors.red, Colors.yellow],
  ///      center: Alignment.center,
  ///      radius: 1,
  ///      tileMode: TileMode.repeated,
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  final Gradient? gradient;

  /// The color to use when drawing the [icon] and the same color will be used to draw [secondaryIcon] unless [secondaryColor] is specified
  ///
  /// Defaults to the current [IconTheme] color, if any.
  ///
  /// The color (whether specified explicitly here or obtained from the
  /// [IconTheme]) will be further adjusted by the opacity of the current
  /// [IconTheme], if any.
  ///
  /// In material apps, if there is a [Theme] without any [IconTheme]s
  /// specified, icon colors default to white if the theme is dark
  /// and black if the theme is light.
  ///
  /// If no [IconTheme] and no [Theme] is specified, icons will default to
  /// black.
  ///
  /// See [Theme] to set the current theme and [ThemeData.brightness]
  /// for setting the current theme's brightness.
  ///
  /// {@tool snippet}
  /// Typically, a Material Design color will be used, as follows:
  ///
  /// ```dart
  /// AdvancedIcon(
  ///   icon: Icons.circle,
  ///   color: Colors.yellow,
  /// )
  /// ```
  /// {@end-tool}
  /// The above snippet will result in yellow colored circle icon 🟡.
  final Color? color;

  ///An optional color to use when drawing the [secondaryIcon].
  ///
  /// Defaults to the current [IconTheme] color, if any.
  ///
  /// The color (whether specified explicitly here or obtained from the
  /// [IconTheme]) will be further adjusted by the opacity of the current
  /// [IconTheme], if any.
  ///
  /// In material apps, if there is a [Theme] without any [IconTheme]s
  /// specified, icon colors default to white if the theme is dark
  /// and black if the theme is light.
  ///
  /// If no [IconTheme] and no [Theme] is specified, icons will default to
  /// black.
  ///
  /// See [Theme] to set the current theme and [ThemeData.brightness]
  /// for setting the current theme's brightness.
  ///
  /// {@tool snippet}
  /// Typically, a Material Design color will be used, as follows:
  ///
  /// ```dart
  /// AdvancedIcon(
  ///   icon: Icons.add,
  ///   secondaryIcon: Icons.check
  ///   color: Colors.white,
  ///   secondaryColor: Colors.green,
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// The above snippet will result in white colored add icon ➕ and green colored check icon ✔️.
  final Color? secondaryColor;

  ///The fraction to scale the icon's alpha value.
  ///
  ///An opacity of 1.0 is fully opaque. An opacity of 0.0 is fully transparent (i.e., invisible).
  ///
  ///Values 1.0 and 0.0 are painted with a fast path. Other values require painting the child into an intermediate buffer, which is expensive.
  ///
  /// * [opacity] will affect both [icon] and [secondaryIcon](if not null).
  /// * For every [AdvancedIconEffect] which includes fade effect, fading range will be from [opacity] to 0.0 if it is not null.
  final double? opacity;

  ///State of the widget.
  ///
  ///State can not be null and it defaults to [AdvancedIconState.primary].
  ///[Icon] will render for [AdvancedIconState.primary] and [secondaryIcon] will render for [AdvancedIconState.secondary].
  ///While changing the state, specified animation will take place for the given duration except in the case of [AdvancedIconEffect.none].
  ///
  ///{@tool snippet}
  /// Typically, [setState] will be used to change the state of [AdvancedIcon], as follows:
  ///
  /// ```dart
  /// class Example extends StatefulWidget {
  ///   const Example({Key? key}) : super(key: key);
  ///
  ///   @override
  ///   _ExampleState createState() => _ExampleState();
  ///}
  ///
  ///class _ExampleState extends State<Example> {
  ///  AdvancedIconState _state=AdvancedIconState.primary;
  ///
  ///  @override
  ///  Widget build(BuildContext context) {
  ///    return GestureDetector(
  ///     onTap: () {
  ///       setState(() {
  ///         if (_state == AdvancedIconState.primary) {
  ///          _state = AdvancedIconState.secondary;
  ///        } else {
  ///           _state == AdvancedIconState.primary;
  ///         }
  ///        });
  ///      },
  ///      child: AdvancedIcon(
  ///        icon: Icons.add,
  ///        secondaryIcon: Icons.check,
  ///        state: _state,
  ///        effect: AdvancedIconEffect.bubble,
  ///      ),
  ///    );
  ///  }
  ///}
  /// ```
  /// {@end-tool}
  ///
  /// Above snippet will give following result:
  ///
  /// Firstly ➕ icon will render on screen and when ➕ will be tapped, widget will change it's state from primary to secondary and running
  /// the bubble animation in 0.3s and ✔️ will render on screen.
  ///
  /// See also:
  /// * [setState], notify the framework that the internal state of this object has changed.
  /// * [AdvancedIconEffect], animation while changing the state of the widget.
  /// * [AdvancedIconState], configures the state of the widget.
  final AdvancedIconState state;

  ///Animation while changing the state of the widget.
  ///
  ///The widget changes it's state between the values of [AdvancedIconState]. The animation runs forward for [AdvancedIconState.primary] to [AdvancedIconState.secondary] and reverse for vice-verse.
  ///Effect can not be null though it does not have any effect if secondaryIcon is null.
  ///
  ///[AdvancedIconEffect.none] is lighter than all other values because it doesn't create any controller or animation for the widget hence state of the widget changes quickly without any animation.
  ///
  ///See also:
  /// * [AdvancedIconEffect], animation while changing the state of the widget.
  /// * [AdvancedIconState], configures the state of the widget.
  final AdvancedIconEffect effect;

  ///The length of time widget will take to change state between [AdvancedIconState.primary] and [AdvancedIconState.secondary] running the animation given in [effect].
  ///
  ///Defaults to 0.3 second.
  ///
  /// * For [AdvancedIconEffect.none] state changing takes no time.
  final Duration? duration;

  /// The text direction to use for rendering the icon.
  ///
  /// If this is null, the ambient [Directionality] is used instead.
  ///
  /// Some icons follow the reading direction. For example, "back" buttons point
  /// left in left-to-right environments and right in right-to-left
  /// environments. Such icons have their [IconData.matchTextDirection] field
  /// set to true, and the [Icon] widget uses the [textDirection] to determine
  /// the orientation in which to draw the icon.
  ///
  /// This property has no effect if the [icon]'s [IconData.matchTextDirection]
  /// field is false, but for consistency a text direction value must always be
  /// specified, either directly using this property or using [Directionality].
  final TextDirection? textDirection;

  ///Semantic label for the icon.
  ///
  ///Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
  ///
  /// * [SemanticsProperties.label], which is set to [semanticLabel] in the underlying [Semantics] widget.
  final String? semanticLabel;

  @override
  _AdvancedIconState createState() => _AdvancedIconState();
}

class _AdvancedIconState extends State<AdvancedIcon>
    with TickerProviderStateMixin {
  bool get _shouldAnimate =>
      widget.secondaryIcon != null && widget.effect != AdvancedIconEffect.none;
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late double _progress;

  @override
  void initState() {
    if (_shouldAnimate) {
      _progress = widget.state == AdvancedIconState.primary ? 1 : 0;
      _controller = AnimationController(
        value: 1,
        duration: widget.effect == AdvancedIconEffect.none
            ? Duration.zero
            : widget.duration,
        vsync: this,
      )..addListener(() => setState(() => _progress = _animation.value));
      _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      );
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AdvancedIcon oldWidget) {
    if (_shouldAnimate) {
      switch (widget.state) {
        case AdvancedIconState.secondary:
          _controller.reverse();
          break;
        default:
          _controller.forward();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (_shouldAnimate) {
      _controller.dispose();
    }
    super.dispose();
  }

  Matrix4 _createTransform() {
    final bool isResting = _progress == 0 || _progress == 1;
    final double angle = isResting
        ? 0
        : math.pi / 2 - (math.pi / 2 * (isResting ? 0 : _progress));
    final double path = isResting ? 0 : _pathFactor - (_progress * _pathFactor);

    return AdvancedIconMatrix.create(
      effect: widget.effect,
      progress: _progress,
      path: -path,
      angle: -angle,
    );
  }

  Matrix4 _createSecondaryTransform() {
    final bool isResting = _progress == 0 || _progress == 1;
    final double angle = math.pi / 2 * (isResting ? 0 : _progress);
    final double path = isResting ? 0 : _progress * _pathFactor;
    return AdvancedIconMatrix.create(
      effect: widget.effect,
      progress: 1.0 - _progress,
      path: path,
      angle: angle,
    );
  }

  AdvancedIconLight _buildChild(AdvancedIconState state) {
    final double? opacity;
    final IconData icon;
    final Color? color;

    double? calcOpacity() {
      switch (widget.effect) {
        case AdvancedIconEffect.bubble:
        case AdvancedIconEffect.spinBubble:
        case AdvancedIconEffect.none:
          return widget.opacity;
        default:
          return state == AdvancedIconState.primary
              ? (widget.opacity ?? 1.0) * _progress
              : (widget.opacity ?? 1.0) * (1.0 - _progress);
      }
    }

    switch (state) {
      case AdvancedIconState.primary:
        icon = widget.icon;
        color = widget.color;
        opacity = widget.secondaryIcon == null ? widget.opacity : calcOpacity();
        break;
      case AdvancedIconState.secondary:
        icon = widget.secondaryIcon!;
        color = widget.secondaryColor ?? widget.color;
        opacity = calcOpacity();
        break;
    }

    return AdvancedIconLight(
      icon,
      color: color,
      size: widget.size,
      gradient: widget.gradient,
      opacity: opacity,
      semanticLabel: widget.semanticLabel,
      textDirection: widget.textDirection,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.secondaryIcon != null) {
      if (widget.effect == AdvancedIconEffect.none) {
        return widget.state == AdvancedIconState.primary
            ? _buildChild(AdvancedIconState.primary)
            : _buildChild(AdvancedIconState.secondary);
      }
      return Stack(
        children: [
          Positioned(
            child: Transform(
              transform: _createTransform(),
              alignment: FractionalOffset.center,
              child: _buildChild(AdvancedIconState.primary),
            ),
          ),
          Positioned(
            child: Transform(
              transform: _createSecondaryTransform(),
              alignment: FractionalOffset.center,
              child: _buildChild(AdvancedIconState.secondary),
            ),
          ),
        ],
      );
    }
    return _buildChild(AdvancedIconState.primary);
  }
}
