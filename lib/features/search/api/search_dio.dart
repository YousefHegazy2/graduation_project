// lib/data/product_repository.dart
import 'package:dio/dio.dart';
import 'package:rentora_app/features/search/models/search_model.dart';


// Use this name to access baseUrl from another page as you mentioned
const String baseUrl = "https://rentora.runasp.net"; 

// This is the correct API path you provided
const String getproduct = "/api/Product/getProducts";

class ProductRepository {
  final Dio dio;

  ProductRepository({Dio? dioClient}) : dio = dioClient ?? Dio();

  Future<List<Product>> getProducts(
      {String query = '', String category = ''}) async {
    try {
      final response = await dio.get('$baseUrl$getproduct', queryParameters: {
        if (query.isNotEmpty) 'search': query,
        if (category.isNotEmpty) 'category': category,
      });

      if (response.statusCode == 200) {
        final data = response.data;

        // Adjust based on the actual shape of your API's response
        final List productsJson =
            data is List ? data : data['products'] as List;

        return productsJson.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
