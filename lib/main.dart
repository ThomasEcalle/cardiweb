import 'package:cardiweb/core/repositories/products_repository/fake_products_data_source.dart';
import 'package:cardiweb/products_screen/products_bloc/products_bloc.dart';
import 'package:cardiweb/products_screen/products_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/repositories/products_repository/api_products_data_source.dart';
import 'core/repositories/products_repository/products_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductsRepository(
        productsDataSource: FakeProductsDataSource(),
        // productsDataSource: ApiProductsDataSource(
        //   dio: Dio(
        //     BaseOptions(baseUrl: 'https://dummyjson.com'),
        //   ),
        // ),
      ),
      child: BlocProvider(
        create: (context) => ProductsBloc(
          productsRepository: context.read<ProductsRepository>(),
        ),
        child: MaterialApp(
          home: ProductsScreen(),
        ),
      ),
    );
  }
}
