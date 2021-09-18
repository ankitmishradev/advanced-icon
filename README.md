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

## Change Icon With Animation

To animate between two icons `secondaryIcon` must not be null and whenever it is not null the widget will look up to `state` and will render only one icon accordingly. To animate the icon from `icon` to `secondaryIcon` or vice versa let's first manage the state of the widget:

### 1. Manage state

This property holds the information about the current state of the widget. This widget can have any one of the following states:

1. `AdvancedIconState.primary`
2. `AdvancedIconState.secondary`

Whenever the state changes, it notifies the widget about the changes and then widget changes the current icon displayed on the screen following the below rules:

1. `icon` will render for `AdvancedIconState.primary`.
2. `secondaryIcon` will render for `AdvancedIconState.secondary`.

`AdvancedIconState` can be changed using any of the following methods:

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

## Decoration

### Gradient

<img src="https://github.com/ankitmishradev/advanced-icon/blob/main/display/decoration_banner.png?raw=true" align="right" width="200" height="360" style="margin-left:10px">

```dart
AdvancedIcon(
  icon:Icons.favorite,
  gradient:const LinearGradient(
    colors: <Color>[Colors.red, Colors.pink],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    step: [0.2,0.8],
  ),
)
```

### Opacity

```dart
AdvancedIcon(
  icon:Icons.apple,
  color: Colors.blue,
  opacity:0.5,
)
```

## Changelog

Please see the [CHANGELOG](https://github.com/ankitmishradev/advanced-icon/blob/main/CHANGELOG.md) to know about the latest updates.

## Contributions

Contribution to this project are most welcomed.

If you find any bug or want any feature/improvement, but don't know how to fix/implement it, please fill an [issue](https://github.com/ankitmishradev/advanced-icon/issues).

If you fixed any bug or implemented any new feature/improvement, please send a [pull request](https://github.com/ankitmishradev/advanced-icon/pulls).
