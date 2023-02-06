import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String? name;
  final String? description;
  final String? category;
  final double? price;
  final List<dynamic>? images;
  final double? promo;
  final String? type;
  final List<dynamic>? size;

  Product({this.size, this.category, required this.id, this.description, this.price, this.images, this.promo, this.type, this.name});

  factory Product.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Product(
      id: snapshot.id,
      name: data?["name"],
      description: data?["description"],
      category: data?["category"],
      images: data?["images"],
      price: double.parse("${data?['price']}"),
      promo: double.parse("${data?['promo']}"),
      type: data?['type'],
      size: data?['size'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (description != null) "description": description,
      if (category != null) "category": category,
      if (images != null) "images": images,
      if (price != null) "price": price,
      if (promo!= null) "promo": promo,
      if (type != null) "type": type,
      if (size != null) "type": size,
    };
  }
}