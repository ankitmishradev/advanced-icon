<p align="center"><img src="https://github.com/ankitmishradev/advanced-icon/blob/main/display/banner.png?raw=true"/></p>

<h1>Advanced Icon</h1>

<p>A flutter package which contains a collection of icon decoration tools such as gradient, opacity and animations to change the icons smoothly.</p>

[![build](https://github.com/ankitmishradev/advanced-icon/actions/workflows/main.yml/badge.svg)](https://github.com/ankitmishradev/advanced-icon/actions/workflows/main.yml)
[![License](https://img.shields.io/github/license/ankitmishradev/advanced-icon)](https://opensource.org/licenses/MIT)

## Installing

Add this package to your flutter project's `pubspec.yaml` file:

```yaml
dependencies:
    ...
    advanced_icon: <latest version>
```

Now in your `Dart` code, you can use:

```dart
import 'package:advanced_icon/advanced_icon.dart';
```

## Features at a Glance

- Icons can be painted with gradient in addition to color.
- Opacity property is avaible to make opaque icons.
- A secondary icon property is also availble to be used in place of icon as per current state.
- A lot of cool animation effects are availble to animate between icon and secondary icon.
- No need to manage animation controller and animations manually.

## Decoration

### Gradient:

<img src='https://github.com/ankitmishradev/advanced-icon/blob/main/display/gradient_demo.png?raw=true' align = "right" height = "256px">
Add gradient to your icons and make them look more appealing by specifying gradient in gradient property of the widget as follows:

```dart
AdvancedIcon(
  icon:Icons.home,
  gradient:const LinearGradient(
    colors: <Color>[Color(0xFFFF0000), Color(0xFFF008CB)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    step: [0.2,0.8],
  ),
)
```

### Opacity:

<img src='https://github.com/ankitmishradev/advanced-icon/blob/main/display/opacity_demo.png?raw=true' align = "right" height = "256px">
Make your icons opaque just by setting the opacity property of the widget. Opacity must be between 0 and 1(including 0 and 1). See an example below:

```dart
AdvancedIcon(
  icon:Icons.home,
  color: Color(0xFF000AFF),
  opacity:0.5,
)
```

## State Management

### AdvancedIconState

This property holds the information about the current state of the widget and notify the widget to show `icon` for the `AdvancedIconState.primary` and `secondaryIcon` for `AdvancedIconState.secondary`. `AdvancedIconState` can be changed using any of the following methods:

- setState
- provider
- stream
- inheritedWidget

Typically, setState will be used to change the state of the widget, as follows:

```dart
class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  AdvancedIconState _state=AdvancedIconState.primary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_state == AdvancedIconState.primary) {
            _state = AdvancedIconState.secondary;
          } else {
            _state == AdvancedIconState.primary;
          }
        });
      },
      child: AdvancedIcon(
        icon: Icons.add,
        secondaryIcon: Icons.check,
        state: \_state,
        effect: AdvancedIconEffect.bubble,
      ),
    );
  }
}

```

## Changelog

Please see the [CHANGELOG](https://github.com/ankitmishradev/advanced-icon/blob/main/CHANGELOG.md) to know about the latest updates.

## Contributions

Contribution to this project are most welcomed.

If you find any bug or want any feature/improvement, but don't know how to fix/implement it, please fill an [issue](https://github.com/ankitmishradev/advanced-icon/issues).

If you fixed any bug or implemented any new feature/improvement, please send a [pull request](https://github.com/ankitmishradev/advanced-icon/pulls).

```

```
