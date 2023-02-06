import 'package:flutter/material.dart';

class ImagesIndex extends StatefulWidget {
  final List elements;
  int? initialIndex;
  final Function(int index) onTap;

  ImagesIndex(
      {Key? key,
      required this.elements,
      this.initialIndex = 0,
      required this.onTap})
      : super(key: key);

  @override
  State<ImagesIndex> createState() => _ImagesIndexState();
}

class _ImagesIndexState extends State<ImagesIndex> {
  @override
  Widget build(BuildContext context) {
    return Row(children: list());
  }

  List<Widget> list() {
    List<Widget> list = [];

    for (int i = 0; i < widget.elements.length; i++) {
      var child = InkWell(
        onTap: () {
          setState(() {
            widget.onTap(i);
            widget.initialIndex = i;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: (widget.initialIndex != i)
                ? Colors.white.withOpacity(0.8)
                : Colors.black87,
            shape: BoxShape.circle,
          ),
        ),
      );

      list.add(child);
    }

    return list;
  }
}
