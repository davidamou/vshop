import 'package:flutter/material.dart';
import 'package:vshop/constants/style.dart';
import 'package:vshop/constants/text_style.dart';
import 'package:vshop/utils/widget_function/function.dart';
import 'package:vshop/widgets/cache_network_image_adaptive.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard({super.key});

  final List<String> images = [
    "https://img01.ztat.net/article/spp-media-p1/ba6b0d8d9e4748fe9bfe84b93d5c8eb8/a64d262652e44659b60812d4477acddb.jpg?imwidth=1800",
    "https://img01.ztat.net/article/spp-media-p1/e65f6010f680416486f5a41a3a038a67/0b81b89da48f4f40be8e72ecd8b23dd1.jpg?imwidth=1800"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: getPrimaryColor(context).withOpacity(0.04),
        borderRadius: defaultBorderRadius,
      ),
      child: InkWell(
        borderRadius: defaultBorderRadius,
        onTap: () {},
        //onTap: () => context.go('/notification-detail'),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: titleMedium(context),
              ),
              const SizedBox(height: 12.0),
              Row(
                children: images
                    .map(
                      (url) => Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          height: 240,
                          child: CacheNetworkImageAdaptive(imageUrl: url),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
