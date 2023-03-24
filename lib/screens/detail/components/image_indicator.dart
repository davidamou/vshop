import 'package:flutter/material.dart';

class ImageIndicator extends StatefulWidget {
  final int imageNumber;
  final int currentIndex;
  final Function(int index)? onTap;

  const ImageIndicator(
      {Key? key, required this.imageNumber, this.currentIndex = 0, this.onTap})
      : super(key: key);

  @override
  State<ImageIndicator> createState() => _ImageIndicatorState();
}

class _ImageIndicatorState extends State<ImageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(children: list());
  }

  List<Widget> list() {
    List<Widget> list = [];

    for (int i = 0; i < widget.imageNumber; i++) {
      var child = InkWell(
        onTap: () {
          setState(() => widget.onTap!(i));
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color:
                (widget.currentIndex != i) ? Colors.white.withOpacity(0.8) : Colors.black87,
            shape: BoxShape.circle,
          ),
        ),
      );

      list.add(child);
    }

    return list;
  }
}
