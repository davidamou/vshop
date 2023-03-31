import 'package:flutter/material.dart';
import 'package:vshop/constants/style.dart';

import '../../../constants/text_style.dart';

class DetailSize extends StatelessWidget {
  final Function(int) onSizeChanged;
  final List<dynamic> size;
  final int? currentIndex;

  const DetailSize(
      {Key? key,
      required this.onSizeChanged,
      required this.size,
      this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: titleMedium(context, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        DefaultTabController(
          length: size.length,
          initialIndex: currentIndex!,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: defaultBorderRadius,
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: TabBar(
                onTap: (index) => onSizeChanged(index),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: size.map((value) => Tab(text: value)).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
