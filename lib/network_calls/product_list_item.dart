import 'package:cardiweb/network_calls/product.dart';
import 'package:flutter/material.dart';

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
      subtitle: Text('Price: ${product.price} euros'),
    );
  }
}
