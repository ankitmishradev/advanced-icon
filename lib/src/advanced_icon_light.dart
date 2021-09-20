import 'package:flutter/material.dart';

class AdvancedIconLight extends StatelessWidget {
  ///Creates an icon widget which contains collection of icon decoration tools such as gradient and opacity.
  ///
  ///This widget is lighter form of [AdvancedIcon] and inherits all properties of material designes [Icon] widget. Advanced icon light is smart enough to build the lightest widget tree possible for given properties without affecting the performance.
  ///
  ///For example:
  /// * Advanced icon light does not use opaque functionalities unless [opacity] property is set.
  /// * Advanced icon light does not use gradient functionalities unless [gradient] property is set.
  const AdvancedIconLight(
    this.icon, {
    Key? key,
    this.size,
    this.color,
    this.gradient,
    this.opacity,
    this.semanticLabel,
    this.textDirection,
  }) : super(key: key);

  /// The icon to display.
  final IconData icon;

  /// The size of the icon in logical pixels.
  ///
  /// Icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the current [IconTheme] size, if any. If there is no
  /// [IconTheme], or it does not specify an explicit size, then it defaults to
  /// 24.0.
  ///
  /// If [AdvancedIconLight] is being placed inside an [IconButton], then use
  /// [IconButton.iconSize] instead, so that the [IconButton] can make the splash
  /// area the appropriate size as well. The [IconButton] uses an [IconTheme] to
  /// pass down the size to the [AdvancedIconLight].
  final double? size;

  /// The gradient to use when drawing the icon.
  ///
  /// If this is specified, [color] has no effect.
  ///
  /// The [gradient] is drawn over the [AdvancedIconLight].
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

  /// The color to use when drawing the icon.
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
  /// AdvancedIconLight(
  ///   Icons.home,
  ///   color: Colors.green,
  /// )
  /// ```
  /// {@end-tool}
  final Color? color;

  ///The fraction to scale the [AdvancedIconLight]'s transparency.
  ///
  ///An opacity of 1.0 is fully opaque. An opacity of 0.0 is fully transparent (i.e., invisible).
  ///
  ///Values 1.0 and 0.0 are painted with a fast path. Other values require painting the child into an intermediate buffer, which is expensive.
  final double? opacity;

  ///The text direction to use for rendering the icon.
  ///
  ///If this is null, the ambient [Directionality] is used instead.
  ///
  ///Some icons follow the reading direction. For example, "back" buttons point left in left-to-right environments and right in right-to-left environments. Such icons have their [IconData.matchTextDirection] field set to true, and the [AdvancedIconLight] widget uses the [textDirection] to determine the orientation in which to draw the icon.
  ///
  ///This property has no effect if the [icon]'s [IconData.matchTextDirection] field is false, but for consistency a text direction value must always be specified, either directly using this property or using [Directionality].
  final TextDirection? textDirection;

  ///Semantic label for the icon.
  ///
  ///Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
  ///
  /// * [SemanticsProperties.label], which is set to [semanticLabel] in the underlying [Semantics] widget.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final Widget iconWidget = Icon(
      icon,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
    final Widget mainWidget = opacity == null
        ? iconWidget
        : Opacity(
            child: iconWidget,
            opacity: opacity!,
          );

    if (gradient != null) {
      return ShaderMask(
        shaderCallback: (Rect bounds) => gradient!.createShader(bounds),
        child: mainWidget,
        blendMode: BlendMode.srcATop,
      );
    } else {
      return mainWidget;
    }
  }
}
