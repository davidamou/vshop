import 'package:flutter/material.dart';

class GridAdaptive extends StatelessWidget {
  final List<Widget> children;

  const GridAdaptive({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> columnOne = [];
    final List<Widget> columnTwo = [];
    int numberOfWidget = children.length;

    for (int i = 0; i < numberOfWidget; i++) {
      if (((numberOfWidget - i) % 2) == 0) {
        columnOne.add(children[i]);
      } else {
        columnTwo.add(children[i]);
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(children: columnOne),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: Column(children: columnTwo),
        ),
      ],
    );
  }
}
