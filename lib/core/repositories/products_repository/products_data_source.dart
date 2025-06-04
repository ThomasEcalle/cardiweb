import 'package:cardiweb/core/models/product.dart';

abstract class ProductsDataSource {
  Future<List<Product>> getProducts();
}
