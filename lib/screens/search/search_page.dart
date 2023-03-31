import 'package:flutter/material.dart';
import 'package:vshop/constants/text_style.dart';
import 'package:vshop/screens/search/components/autocomplete_search.dart';
import 'package:vshop/widgets/product_card.dart';
import 'package:vshop/widgets/grid_adaptive.dart';
import 'package:vshop/screens/search/components/recent_search.dart';
import '../../models/product.dart';

class SearchPage extends StatefulWidget {
  static List<String> searchList = [];
  static List<String> wordSuggestions = [];
  static final List<Product> recentViewList = [];

  const SearchPage({Key? key}) : super(key: key);

  static addToRecentViewList(Product product) {
    if (SearchPage.recentViewList
        .where((element) => element.id == product.id)
        .toList()
        .isEmpty) {
      SearchPage.recentViewList.add(product);
    }
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4.0),
              AutocompleteSearch(wordSuggestions: SearchPage.wordSuggestions),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Searches',
                      style: titleSmall(context, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16.0),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: SearchPage.searchList
                          .map((text) => RecentSearch(text: text))
                          .toList(),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Recent views',
                      style: titleSmall(context, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12.0),
                    (SearchPage.recentViewList.isNotEmpty)
                        ? GridAdaptive(
                      children: SearchPage.recentViewList
                          .map((product) =>
                          ProductCard(product: product))
                          .toList(),
                    )
                        : const Center(
                      child: Text('No recent views'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
