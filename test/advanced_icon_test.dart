import 'package:advanced_icon/advanced_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Flutter Widget Test", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AdvancedIcon(icon: Icons.home),
        ),
      ),
    );
    var textField = find.byType(Icon);
    expect(textField, findsOneWidget);
  });
}
