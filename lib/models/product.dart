class Product {
  final String? name;
  final String? description;
  final double? price;
  final List<dynamic>? images;

  Product(this.description, this.price, this.images, {this.name});
}