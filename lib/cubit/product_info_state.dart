part of 'product_info_cubit.dart';

abstract class ProductInfoState extends Equatable {
  const ProductInfoState();

  @override
  List<Object> get props => [];
}

class ProductInfoInitial extends ProductInfoState {}

class ProductInfoLoading extends ProductInfoState {}

class ProductInfoFetched extends ProductInfoState {
  const ProductInfoFetched(this.product);

  final ProductModel product;

  @override
  List<Object> get props => [product.id!];
}

class ProductInfoError extends ProductInfoState {
  const ProductInfoError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
