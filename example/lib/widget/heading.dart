import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        text,
        style: theme.textTheme.headline6!.copyWith(
          color: Colors.grey[700],
          fontSize: 20.0,
        ),
      ),
    );
  }
}
