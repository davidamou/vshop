import 'package:flutter/material.dart';
import 'package:vshop/widgets/cache_network_image_adaptive.dart';

import '../constants/style.dart';

class CardItem extends StatefulWidget {
  final int quantity = 1;

  const CardItem({super.key});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
 @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: size.width / 5,
              height: size.height / 8,
              child: const CacheNetworkImageAdaptive(
                imageUrl: "",
              ),
            ),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2.0),
                const Text('Size: 36  *  Color: Brown'),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      '\$',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '120',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
          decoration: BoxDecoration(
            borderRadius: defaultBorderRadius,
            border: Border.all(
              width: 0.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              quantityButton(
                icon: const Text('-'),
                onTap: () {},
              ),
              const SizedBox(width: 4.0),
              Text('${widget.quantity}'),
              const SizedBox(width: 4.0),
              quantityButton(
                icon: const Text('+'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  quantityButton({required Widget icon, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: defaultBorderRadius,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: icon,
      ),
    );
  }
}