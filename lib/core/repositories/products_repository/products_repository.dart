import '../../app_exceptions/app_exceptions.dart';
import '../../models/product.dart';
import 'products_data_source.dart';

final class ProductsRepository {
  ProductsRepository({required this.productsDataSource});

  final ProductsDataSource productsDataSource;

  Future<List<Product>> getProducts() async {
    try {
      return await productsDataSource.getProducts();
    } catch (error) {
      throw AppException.from(error);
    }
  }
}
