import 'package:cardiweb/core/app_exceptions/app_exceptions.dart';
import 'package:cardiweb/core/models/product.dart';
import 'package:dio/dio.dart';

import 'products_data_source.dart';

final class ApiProductsDataSource extends ProductsDataSource {
  final Dio dio;

  ApiProductsDataSource({required this.dio});

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await dio.get('/products');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['products'];
        return data.map((item) => Product.fromJson(item)).toList();
      }

      throw UnknownException();
    } catch (error) {
      throw AppException.from(error);
    }
  }
}
