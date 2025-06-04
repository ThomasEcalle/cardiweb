import 'package:cardiweb/network_calls/product.dart';
import 'package:cardiweb/network_calls/product_list_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkCallsScreen extends StatefulWidget {
  const NetworkCallsScreen({super.key});

  @override
  State<NetworkCallsScreen> createState() => _NetworkCallsScreenState();
}

class _NetworkCallsScreenState extends State<NetworkCallsScreen> {
  bool _loading = false;
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  void _getProducts() async {
    final dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

    setState(() {
      _loading = true;
    });

    try {
      // Fake duration
      await Future.delayed(const Duration(seconds: 1));
      final response = await dio.get('/products');
      if (response.statusCode == 200) {
        final data = response.data['products'] as List;
        _products = data.map((item) => Product.fromJson(item)).toList();
        return;
      }

      throw Exception('Failed to load products');
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_products.isEmpty) {
      return const Center(
        child: Text('No products available'),
      );
    }

    return ListView.separated(
      itemCount: _products.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final product = _products[index];
        return ProductListItem(product: product);
      },
    );
  }
}
