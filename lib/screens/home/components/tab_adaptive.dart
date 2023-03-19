import 'package:flutter/material.dart';

import '../../../constants/style.dart';

class TabAdaptive extends StatelessWidget {
  final String text;

  const TabAdaptive({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: defaultBorderRadius,
        border: Border.all(
          color: Colors.black.withOpacity(.2),
          width: 0.5,
        ),
      ),
      child: Tab(text: text),
    );
  }
}
