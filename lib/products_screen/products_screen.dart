import 'package:cardiweb/products_screen/product_list_item.dart';
import 'package:cardiweb/products_screen/products_bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/app_exceptions/app_exceptions.dart';
import '../core/models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    //BlocProvider.of<ProductsBloc>(context).add(const GetProducts());
    context.read<ProductsBloc>().add(const GetProducts());
  }

  @override
  Widget build(BuildContext context) {
    final producstStata = context.watch<ProductsBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state.status == ProductsStatus.error) {
            _showErrorSnackBar(context, state.exception);
          }
        },
        builder: (context, state) {
          return switch (state.status) {
            ProductsStatus.initial || ProductsStatus.loading => _buildLoading(context),
            ProductsStatus.error => _buildError(context, state.exception),
            ProductsStatus.success => _buildProductsList(context, state.products),
          };
        },
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(BuildContext context, AppException? exception) {
    return Center(
      child: Text('Error: ${exception?.title} - ${exception?.message}'),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return const Center(
      child: Text('No products available'),
    );
  }

  Widget _buildProductsList(BuildContext context, List<Product> products) {
    if (products.isEmpty) return _buildEmpty(context);
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductListItem(product: product);
      },
    );
  }

  void _showErrorSnackBar(BuildContext context, AppException? exception) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: ${exception?.title} - ${exception?.message}'),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
