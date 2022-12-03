import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/di/service_locator.dart';
import '../data/models/product_model.dart';
import '../data/repository/product_repository.dart';

part 'product_info_state.dart';

class ProductInfoCubit extends Cubit<ProductInfoState> {
  ProductInfoCubit() : super(ProductInfoInitial());

  final ProductRepository _productRepository = getIt<ProductRepository>();

  Future<void> fetchProduct(String id) async {
    emit(ProductInfoLoading());
    try {
      final ProductModel product = await _productRepository.info(id);

      emit(ProductInfoFetched(product));
    } catch (e) {
      emit(ProductInfoError(e.toString()));
    }
  }
}
