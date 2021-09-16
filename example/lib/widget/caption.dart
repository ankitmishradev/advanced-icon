import 'package:flutter/material.dart';

class Caption extends StatelessWidget {
  const Caption(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
      child: Text(
        text,
        style: theme.textTheme.caption!.copyWith(
          fontSize: 15.0,
        ),
      ),
    );
  }
}
