import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vshop/screens/search/search_page.dart';
import 'package:vshop/widgets/product_card.dart';
import 'package:vshop/widgets/grid_adaptive.dart';
import '../../../models/product.dart';
import '../../../utils/widget_function/function.dart';

class GridBuilder extends StatelessWidget {
  final Stream<QuerySnapshot<Product>> data;

  const GridBuilder({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Product>>(
      stream: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AspectRatio(
            aspectRatio: 1.2,
            child: placeHolder(context),
          );
        } else if (snapshot.hasData) {
          return GridAdaptive(
              children: snapshot.data!.docs.map((product) {
            var word = product.data().name!;
            if (!SearchPage.wordSuggestions.contains(word)) {
              SearchPage.wordSuggestions.add(word);
            }
            return ProductCard(
              product: product.data(),
            );
          }).toList());
        } else {
          return const Center(
            child: Text('No data'),
          );
        }
      },
    );
  }

  Widget placeHolder(BuildContext context) {
    var place = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 0.7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: getPrimaryColor(context).withOpacity(0.4),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 16,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: getPrimaryColor(context).withOpacity(0.4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 16,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: getPrimaryColor(context).withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
    return AspectRatio(
      aspectRatio: 1,
      child: Row(
        children: [
          place,
          const SizedBox(width: 8),
          place,
        ],
      ),
    );
  }
}
