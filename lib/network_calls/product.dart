class Product {
  final int? id;
  final String? name;
  final double? price;

  const Product({
    this.id,
    this.name,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['title'],
      price: json['price'],
    );
  }
}
