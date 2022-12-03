part of 'product_search_cubit.dart';

abstract class ProductSearchState extends Equatable {
  const ProductSearchState();

  @override
  List<Object> get props => [];
}

class ProductSearchInitial extends ProductSearchState {}

class ProductSearchLoading extends ProductSearchState {}

class ProductSearchFetched extends ProductSearchState {
  const ProductSearchFetched(this.response);

  final ProductResponse response;

  @override
  List<Object> get props => [response];
}

class ProductSearchError extends ProductSearchState {
  const ProductSearchError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
