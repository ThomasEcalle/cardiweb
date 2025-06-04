import 'package:cardiweb/core/models/product.dart';
import 'package:cardiweb/core/repositories/products_repository/products_data_source.dart';

class FakeProductsDataSource extends ProductsDataSource {
  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(10, (index) {
      return Product(
        id: index,
        name: 'Product $index',
        price: index.toDouble(),
      );
    });
  }
}
