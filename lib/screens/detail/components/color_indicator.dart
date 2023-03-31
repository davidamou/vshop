import 'package:flutter/material.dart';
import 'package:vshop/constants/style.dart';
import 'package:vshop/constants/text_style.dart';

class ColorIndicator extends StatefulWidget {
  final int currentIndex;
  final Function(int index) onTap;
  final List<Color> colors;

  const ColorIndicator(
      {Key? key,
      this.currentIndex = 0,
      required this.onTap,
      required this.colors})
      : super(key: key);

  @override
  State<ColorIndicator> createState() => _ColorIndicatorState();
}

class _ColorIndicatorState extends State<ColorIndicator> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (int i = 0; i < widget.colors.length; i++) {
      var child = InkWell(
        onTap: () {
          setState(() {
            widget.onTap(i);
          });
        },
        borderRadius: defaultBorderRadius,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.colors[i],
            borderRadius: defaultBorderRadius,
          ),
        ),
      );

      if (widget.currentIndex == i) {
        children.add(
          Container(
            padding: const EdgeInsets.all(1),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: defaultBorderRadius,
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
              ),
            ),
            child: child,
          ),
        );
      } else {
        children.add(
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: child,
          ),
        );
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: titleMedium(context, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(children: children),
      ],
    );
  }
}
