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
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.8],
          colors: [Color(0xFF0D1117), Color(0xFF161B22)],
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
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
