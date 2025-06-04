import 'package:flutter/material.dart';

import '../core/models/product.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name ?? 'No Name'),
      subtitle: Text('\$${product.price?.toStringAsFixed(2)}'),
    );
  }
}
