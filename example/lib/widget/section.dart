import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    Key? key,
    required this.body,
    this.caption,
  }) : super(key: key);

  final Widget body;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: kElevationToShadow[3],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.2, 0.8],
          colors: [Colors.blueGrey[200]!, Colors.blueGrey[50]!],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: body,
            ),
          ),
          caption != null
              ? Text(
                  caption!,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.caption!.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
