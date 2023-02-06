import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class ProductProvider {
  static final ref = FirebaseFirestore.instance.collection('products').withConverter(
  fromFirestore: Product.fromFirestore,
  toFirestore: (Product product, _) => product.toFirestore(),
  );

  // static Stream<QuerySnapshot<Product>> getAll() {
  //
  // }
}
