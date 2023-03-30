import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vshop/constants/text_style.dart';
import 'package:vshop/widgets/product_card.dart';
import 'package:vshop/widgets/grid_adaptive.dart';
import 'package:vshop/screens/search/components/recent_search.dart';

import '../../models/product.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  static List<String> searchList = [
    'Shoe',
    'Dress',
    'T-Shirt',
    'Pant',
    'Shirt',
    'Jacket',
    'Sweater',
    'Socks'
  ];

  static final List<Product> _recentViewList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          keyboardType: TextInputType.text,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: const InputDecoration(
            constraints: BoxConstraints(maxHeight: 40),
            prefixIcon: Icon(
              Iconsax.search_normal_1,
              size: 20,
            ),
            hintText: 'Search here',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Text(
              'Recent Searches',
              style: titleSmall(context, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children:
                  searchList.map((text) => RecentSearch(text: text)).toList(),
            ),
            const SizedBox(height: 28.0),
            Text(
              'Recent views',
              style: titleSmall(context, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12.0),
            (_recentViewList.isNotEmpty)
                ? GridAdaptive(
                    children: _recentViewList
                        .map((product) => ProductCard(product: product))
                        .toList(),
                  )
                : const Center(
                    child: Text('No recent views'),
                  ),
          ],
        ),
      ),
    );
  }

  static addToRecentViewList(Product product) {
   if (_recentViewList.where((element) => element.id == product.id).toList().isEmpty) {
      _recentViewList.add(product);
    }
  }
}
