import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vshop/widgets/card_adaptive.dart';

import '../models/product.dart';

class GridAdaptive extends StatelessWidget {
  final Stream<QuerySnapshot<Product>> data;

  const GridAdaptive({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Product>>(
      stream: data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return showData(snapshot.data!.docs.map((product) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CardAdaptive(product: product.data()),
          )).toList());
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

  Widget showData(List<Widget> products) {
    final List<Widget> columnOne = [];
    final List<Widget> columnTwo = [];
    int numberOfWidget = products.length;

    for (int i = 0; i < numberOfWidget; i++) {
      int modulo = ((numberOfWidget - i) % 2);
      if (modulo == 0) {
        columnOne.add(products[i]);
      } else {
        columnTwo.add(products[i]);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(children: columnOne),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Column(children: columnTwo),
        ),
      ],
    );
  }
}
