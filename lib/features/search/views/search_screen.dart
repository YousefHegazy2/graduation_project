import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:rentora_app/cores/databases/cache/cache_helper.dart';
import 'package:rentora_app/features/search/api/search_dio.dart';
import 'package:rentora_app/features/search/cubit/search_cubit.dart';
import 'package:rentora_app/features/search/cubit/search_state.dart';
import 'package:rentora_app/features/shopping/widgets/productCard.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final ProductCubit cubit;

  @override
  void initState() {
    super.initState();

    final token = CacheHelper.sharedPreferences.getString('token');
    final dio = Dio();

    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    final repository = ProductRepository(dioClient: dio);
    cubit = ProductCubit(repository);

    // Optional: Fetch all products initially
    cubit.fetchProducts();
  }

  void _onSearchChanged(String text) {
    cubit.fetchProducts(query: text);
  }

  void _showFilterOptions() {
    final categories = ["Sports", "Travels", "Electronics", "Transportation"];
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: categories.map((category) {
            return ListTile(
              title: Text(category),
              onTap: () {
                cubit.fetchProducts(category: category);
                Navigator.pop(ctx);
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              // Search and Filter UI
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search products...',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: _onSearchChanged,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: _showFilterOptions,
                    ),
                  ],
                ),
              ),

              // BlocBuilder to manage product state
              Expanded(
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ProductLoaded) {
                      final products = state.products;

                      if (products.isEmpty) {
                        return Center(child: Text("No products found."));
                      }

                      return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductCard(
                            image: product.imageUrl ?? '',
                            itemName: product.name ?? '',
                            location: '',
                            onAddPressed: () {},
                            price: product.price?.toString() ?? '',
                          );
                        },
                      );
                    }

                    return SizedBox(); // Default empty state
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
