import 'package:bloc/bloc.dart';
import 'package:cardiweb/core/app_exceptions/app_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../core/models/product.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsState()) {
    on<GetProducts>(_onGetProducts);
  }

  void _onGetProducts(GetProducts event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: ProductsStatus.loading));

    try {
      final products = await getProducts();
      emit(state.copyWith(status: ProductsStatus.success, products: products));
    } catch (error) {
      emit(state.copyWith(status: ProductsStatus.error, exception: AppException.from(error)));
    }
  }

  Future<List<Product>> getProducts() async {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://dummyjson.com',
    ));

    try {
      final response = await dio.get('/products');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['products'];
        return data.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw AppException.from(error);
    }
  }
}
