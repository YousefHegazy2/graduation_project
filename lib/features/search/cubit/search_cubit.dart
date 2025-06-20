// lib/cubit/product_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:rentora_app/features/search/api/search_dio.dart';
import 'package:rentora_app/features/search/cubit/search_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;
  ProductCubit(this.repository) : super(ProductInitial());

  // Fetch products given optional search or category
  void fetchProducts({String query = '', String category = ''}) async {
    emit(ProductLoading());
    try {
      final products = await repository.getProducts(query: query, category: category);
      emit(ProductLoaded(products));
    } catch (e) {
      
    }
  }
}
