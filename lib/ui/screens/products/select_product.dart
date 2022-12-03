import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/product_search_cubit.dart';
import '../../../data/models/product_model.dart';
import '../../../data/models/user_model.dart';
import '../../widgets/user_list_card.dart';
import 'components/product_item_card.dart';

class SelectProductScreen extends StatefulWidget {
  const SelectProductScreen({super.key});

  @override
  State<SelectProductScreen> createState() => _SelectProductScreenState();
}

class _SelectProductScreenState extends State<SelectProductScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductSearchCubit()..search(''),
      child: BlocBuilder<ProductSearchCubit, ProductSearchState>(
        builder: (context, state) {
          return _buildScreen(context, state);
        },
      ),
    );
  }

  Widget _buildScreen(BuildContext context, ProductSearchState state) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.grey.shade900,
        title: SizedBox(
          height: 38,
          child: TextField(
            onChanged: (value) {
              BlocProvider.of<ProductSearchCubit>(context).search(value);
            },
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
                filled: true,
                // fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.zero,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                focusColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: 'Buscar un producto'),
          ),
        ),
      ),
      body: Container(
        // color: Colors.grey.shade900,
        child: _buildProductList(context, state),
      ),
    );
  }

  Widget _buildProductList(BuildContext context, ProductSearchState state) {
    if (state is ProductSearchLoading || state is ProductSearchInitial) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is ProductSearchError) {
      return Center(child: Text('Error: ${state.message}'));
    }

    if (state is! ProductSearchFetched) {
      return const Center(child: Text('Unknown state: '));
    }
    final products = state.response.products!;

    return products.isNotEmpty
        ? ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductItemCard(
                product: products[index],
                onTap: () => _selectProduct(products[index]),
              );
            })
        : const Center(
            child: Text(
            'No se encontraron productos',
            style: TextStyle(color: Colors.white),
          ));
  }

  void _selectProduct(ProductModel product) {
    Navigator.pop(context, product);
  }
}
