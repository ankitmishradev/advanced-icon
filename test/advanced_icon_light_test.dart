import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:advanced_icon/advanced_icon.dart';

Widget injectChildInApp(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}

void main() {
  testWidgets("Verify existance of widget by key", (WidgetTester tester) async {
    const Key key = Key("advanced_icon");
    await tester.pumpWidget(
      injectChildInApp(
        const AdvancedIconLight(Icons.home, key: key),
      ),
    );
    final Finder finder = find.byKey(key);
    expect(finder, findsOneWidget);
  });

  testWidgets("Render home icon", (WidgetTester tester) async {
    const IconData iconData = Icons.home;
    await tester.pumpWidget(
      injectChildInApp(
        const AdvancedIconLight(iconData),
      ),
    );
    final Finder finder = find.byType(Icon);
    expect(finder, findsOneWidget);
  });

  testWidgets("Render icon with blue color", (WidgetTester tester) async {
    const IconData iconData = Icons.home;
    const Color iconColor = Colors.blue;
    await tester.pumpWidget(
      injectChildInApp(
        const AdvancedIconLight(iconData, color: iconColor),
      ),
    );
    final Finder finder = find.byType(Icon);
    expect(finder, findsOneWidget);
    final Icon icon = tester.firstWidget(finder) as Icon;
    expect(icon.color, iconColor);
    expect(icon.icon, iconData);
  });

  testWidgets("Render icon with gradient", (WidgetTester tester) async {
    const IconData iconData = Icons.add;
    const Gradient iconGradient =
        LinearGradient(colors: [Colors.blue, Colors.green]);
    await tester.pumpWidget(
      injectChildInApp(
        const AdvancedIconLight(iconData, gradient: iconGradient),
      ),
    );
    final Finder finder = find.widgetWithIcon(ShaderMask, iconData);
    expect(finder, findsOneWidget);
  });

  testWidgets("Render icon with opacity 0.5", (WidgetTester tester) async {
    const IconData iconData = Icons.check;
    const double iconOpacity = 0.5;
    await tester.pumpWidget(
      injectChildInApp(
        const AdvancedIconLight(iconData, opacity: iconOpacity),
      ),
    );
    final Finder finder = find.byType(Opacity);
    expect(finder, findsOneWidget);
    final Opacity opacity = tester.firstWidget(finder) as Opacity;
    expect(opacity.opacity, iconOpacity);
    expect((opacity.child as Icon).icon, iconData);
  });
}
