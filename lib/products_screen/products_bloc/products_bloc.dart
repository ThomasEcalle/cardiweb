import 'package:bloc/bloc.dart';
import 'package:cardiweb/core/app_exceptions/app_exceptions.dart';
import 'package:meta/meta.dart';

import '../../core/models/product.dart';
import '../../core/repositories/products_repository/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;

  ProductsBloc({required this.productsRepository}) : super(const ProductsState()) {
    on<GetProducts>(_onGetProducts);
  }

  void _onGetProducts(GetProducts event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: ProductsStatus.loading));

    try {
      final products = await productsRepository.getProducts();
      emit(state.copyWith(status: ProductsStatus.success, products: products));
    } catch (error) {
      emit(state.copyWith(status: ProductsStatus.error, exception: AppException.from(error)));
    }
  }
}
