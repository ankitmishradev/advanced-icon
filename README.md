<p align="center"><img src="https://github.com/ankitmishradev/advanced-icon/blob/main/display/header.png?raw=true"/></p>

# Advanced Icon

A flutter package which contains collection of icon decoration tools such as gradient, opacity and icon transition feature with cool animation effects.

[![Build Status](https://img.shields.io/github/workflow/status/ankitmishradev/advanced-icon/build/main)](https://github.com/ankitmishradev/advanced-icon/actions/workflows/main.yml)
[![MIT License](https://img.shields.io/github/license/ankitmishradev/advanced-icon?color=red)](https://opensource.org/licenses/MIT)

## Installing

With flutter run this command

```console
flutter pub add advanced_icon
```

This will add a line like this to your package's `pubspec.yaml` (and run an implicit flutter pub get):

```yaml
dependencies:
  advanced_icon: <latest version>
```

Now in your `Dart` code, you can use:

```dart
import 'package:advanced_icon/advanced_icon.dart';
```

## Features at a Glance

1. An optional `secondaryIcon` property is available to enhance user interaction with minimal manual effort.
2. Cool animation effects are available to make smooth transition between `icon` and `secondaryIcon`.
3. In addition to color, icons can also be painted with gradient.
4. Opacity property is available to make opaque icons.
5. Inherits all properties of material designed `Icon` widget.

## Icon Transition

To use icon transition feature, `secondaryIcon` must not be null and when it is not null the widget will look up for `state` and will show icons according to current state. To change the icon from `icon` to `secondaryIcon` or vice-versa, let's first manage the state of the widget:

### 1. Manage state

`state` holds the information about the current state of the widget. This widget can have any one of the following states:

1. `AdvancedIconState.primary`
2. `AdvancedIconState.secondary`

Whenever the state changes, it notifies the widget and widget changes the current icon following below rules:

1. `icon` will appear for `AdvancedIconState.primary`.
2. `secondaryIcon` will appear for `AdvancedIconState.secondary`.

`state` can be changed using any of the following methods:

- setState
- provider
- stream
- inheritedWidget
- or any other methods used for state management in flutter.

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

## Decoration

### Gradient

```dart
AdvancedIcon(
  icon: Icons.photo_camera,
  gradient: const LinearGradient(
    colors: <Color>[Colors.red, Colors.green],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    step: [0.2,0.8],
  ),
)
```

### Opacity

```dart
AdvancedIcon(
  icon: Icons.direction_bike,
  color: Colors.red,
  opacity: 0.5,
)
```

### Decoration Result

![Decoration banner](https://github.com/ankitmishradev/advanced-icon/blob/main/display/decoration_banner.png?raw=true)

## Changelog

Please see the [CHANGELOG](https://github.com/ankitmishradev/advanced-icon/blob/main/CHANGELOG.md) to know about the latest updates.

## Contributions

Contribution to this project are most welcomed.

## Bugs & Fixes

If you find any bug or want any feature/improvement, but don't know how to fix/implement it, please fill an [issue](https://github.com/ankitmishradev/advanced-icon/issues).

If you fixed any bug or implemented any new feature/improvement, please send a [pull request](https://github.com/ankitmishradev/advanced-icon/pulls).
