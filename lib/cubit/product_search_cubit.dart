import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../data/di/service_locator.dart';
import '../data/models/product_response_model.dart';
import '../data/repository/product_repository.dart';

part 'product_search_state.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> {
  ProductSearchCubit() : super(ProductSearchInitial()) {
    _searchSubject.debounce((_) => TimerStream(true, const Duration(milliseconds: 500))).asyncMap((query) {
      _searchProducts(query);
    }).listen((_) {});
  }
  final BehaviorSubject<String> _searchSubject = BehaviorSubject<String>();
  final BehaviorSubject<ProductResponse> _prodResponseSubject = BehaviorSubject<ProductResponse>(); // ahorita no se usa
  final ProductRepository _productRepository = getIt<ProductRepository>();

  void search(String query) {
    _searchSubject.add(query);
  }

  Future<void> _searchProducts(String query) async {
    emit(ProductSearchLoading());
    try {
      final ProductResponse response = await _productRepository.search(query);
      _prodResponseSubject.add(response);

      emit(ProductSearchFetched(response));
    } catch (e) {
      emit(ProductSearchError(e.toString()));
    }
  }
}
