// lib/cubit/product_state.dart
import 'package:equatable/equatable.dart';
import 'package:rentora_app/features/search/models/search_model.dart';


abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
  @override
  List<Object?> get props => [products];
}

