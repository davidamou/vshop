import 'package:flutter/material.dart';
import 'package:vshop/constants/colors.dart';
import 'package:vshop/constants/text_style.dart';

class RecentSearch extends StatelessWidget {
  final String text;

  const RecentSearch({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: getPrimaryColor(context).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: bodySmall(context),
        ),
      ),
    );
  }
}
