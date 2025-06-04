part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {
  const ProductsEvent();
}

class GetProducts extends ProductsEvent {
  const GetProducts();
}
