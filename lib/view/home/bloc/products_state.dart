part of 'products_bloc.dart';

class ProductsState {
  
  final ProductsStateStatus productsStateStatus;
  final ProductsModel productsData;
  final bool isStatusCode404 ;
  final String errorMessage;

  const ProductsState(
      {

      required this.productsStateStatus,
      required this.productsData,
      required this.isStatusCode404,
      required this.errorMessage});

  factory ProductsState.initial() {
    return const ProductsState(
        productsStateStatus: ProductsStateStatus.init,
        isStatusCode404: false,
        productsData: ProductsModel(),
        errorMessage: ''
    );
  }

  ProductsState copyWith({
    final ProductsStateStatus? productsStateStatus,
    final ProductsModel? productsData,
    final bool? isStatusCode404,
    final String? errorMessage,
  }) {
    return ProductsState(
        productsStateStatus: productsStateStatus ?? this.productsStateStatus,
        productsData: productsData ?? this.productsData,
        isStatusCode404: isStatusCode404 ?? this.isStatusCode404,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }
}

enum ProductsStateStatus{init,loading,success,error}
