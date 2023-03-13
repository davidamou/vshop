import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vshop/screens/shopping_page.dart';
import 'package:vshop/widgets/product_chart.dart';

import '../constants/function.dart';
import '../constants/style.dart';
import '../models/product.dart';
import '../widgets/imges_index.dart';
import '../widgets/row_color.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _imageColorIndex = 0;
  int _imageIndex = 0;
  int _size = 0;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final titleStyle = textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              leading: back(context),
              actions: [
                IconButton(
                  onPressed: () => context.push('/shopping'),
                  icon: const Icon(Iconsax.shopping_bag),
                ),
                 IconButton(
                  onPressed: _addToFavorite,
                  icon: const Icon(Iconsax.heart),
                ),  
              ],
              expandedHeight: height / 1.2,
              flexibleSpace: Stack(
                children: [
                  Hero(
                    tag: product.id,
                    child: SizedBox(
                      width: double.infinity,
                      child: CarouselSlider(
                        items: _getListImage(product),
                        options: CarouselOptions(
                          initialPage: _imageIndex,
                          onPageChanged: (index, reason) {
                            setState(() => _imageIndex = index);
                          },
                          viewportFraction: 1,
                          aspectRatio: 0.1,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: RowColor(
                      currentIndex: _imageColorIndex,
                      onTap: (index) =>
                          setState(() => _imageColorIndex = index),
                      colors: getColors(product),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: ImagesIndex(
                      initialIndex: _imageIndex,
                      onTap: (index) => setState(() => _imageIndex = index),
                      elements: product.images?[_imageColorIndex]['imagesUrl']
                          as List,
                    ),
                  ),
                ],
              ),
            ),
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

  List<Color> getColors(Product product) {
    return product.images!
        .map((image) => Color(int.parse("0xff${image['color']}")))
        .toList();
  }

  List<Widget> _getListImage(Product product) {
    return (product.images?[_imageColorIndex]['imagesUrl'] as List)
        .map(
          (imageUrl) => CachedNetworkImage(
            imageUrl: "$imageUrl",
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            placeholder: (context, url) => Container(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
          ),
        )
        .toList();
  }

  void _addToCart() {
    ShoppingPage.chartListProduct.add(
      ProductChart(
        quantity: 1,
        productId: widget.product.id,
        imageUrl: widget.product.images?[_imageColorIndex]['imagesUrl']
            [_imageIndex],
        productName: "${widget.product.name}",
        price: widget.product.price!,
        size: widget.product.size?[_size],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Poduct added to cart'),
      ),
    );
  }

  void _addToFavorite() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Poduct added to favorite'),
      ),
    );
  }
}
