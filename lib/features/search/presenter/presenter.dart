import 'package:dio/dio.dart';
import 'package:rentora_app/cores/databases/cache/cache_helper.dart';
import 'package:rentora_app/features/search/models/search_model.dart';

const String baseUrl = "https://rentora.runasp.net";
const String getproduct = "/api/Product/getProducts";

Future<List<Product>> fetchProducts(
    {String query = '', String category = ''}) async {
  try {
    final token = CacheHelper.sharedPreferences.getString('token');
    final dio = Dio();

    final response = await dio.get(
      '$baseUrl$getproduct',
      queryParameters: {
        if (query.isNotEmpty) 'search': query,
        if (category.isNotEmpty) 'category': category,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;
      final List productsJson = data is List ? data : data['products'] as List;
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products: ');
    }
  } catch (e) {
    throw Exception('Failed to load products: ');
  }
}
