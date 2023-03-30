import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vshop/widgets/product_card.dart';
import 'package:vshop/widgets/grid_adaptive.dart';

import '../../../models/product.dart';

class GridBuilder extends StatelessWidget {
  final Stream<QuerySnapshot<Product>> data;

  const GridBuilder({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Product>>(
      stream: data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridAdaptive(
              children: snapshot.data!.docs
                  .map(
                    (product) => ProductCard(
                      product: product.data(),
                    ),
                  )
                  .toList());
        }
        if (snapshot.hasError) {
          return Container();
        }
        return const AspectRatio(
          aspectRatio: 1,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
