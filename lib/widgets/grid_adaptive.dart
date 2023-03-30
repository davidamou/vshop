import 'package:flutter/material.dart';

class GridAdaptive extends StatelessWidget {
  final List<Widget> children;

  GridAdaptive({Key? key, required this.children}) : super(key: key);

  final List<Widget> columnOne = [];
  final List<Widget> columnTwo = [];

  @override
  Widget build(BuildContext context) {
    for (var child in children) {
      var newChild = Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: child,
      );
      if (children.indexOf(child).isEven) {
        columnOne.add(newChild);
      } else {
        columnTwo.add(newChild);
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
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Column(children: columnTwo),
        ),
      ],
    );
  }
}
