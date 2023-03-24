import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vshop/screens/detail/components/detail_app_bar.dart';
import '../../constants/style.dart';
import '../../models/product.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _size = 0;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final titleStyle = textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            DetailAppBar(images: product.images!),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      '${product.name}',
                      style: textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.star1,
                          color: Colors.amber,
                          size: 12,
                        ),
                        Text(
                          " 4.8",
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "(3335)   *   212 reviwes",
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${product.description}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary.withOpacity(0.5),
                      ),
                    ),

                    //Sizes
                    const SizedBox(height: 20),
                    Text('Sizes', style: titleStyle),
                    const SizedBox(height: 8),
                    DefaultTabController(
                      length: product.size!.length,
                      initialIndex: _size,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: defaultBorderRadius,
                          border: Border.all(
                            width: 1,
                            color: theme.colorScheme.primary.withOpacity(0.1),
                          ),
                        ),
                        child: TabBar(
                          onTap: (value) => setState(() {
                            _size = value;
                          }),
                          isScrollable: true,
                          dividerColor: Colors.transparent,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: product.size!.map((s) => Tab(text: s)).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: theme.colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Text("\$"),
                  Text(
                    "${(product.price! * product.promo!) / 100}",
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("  \$"),
                  Text(
                    "${product.price}",
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: _addToCart,
                child: const Text('Add to cart'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Poduct added to cart'),
      ),
    );
  }
}
