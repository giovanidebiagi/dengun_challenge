import 'package:dengun_challenge/core/domain/entities/product.dart';
import 'package:dengun_challenge/core/injection_container.dart';
import 'package:dengun_challenge/features/products_list/domain/usecases/get_products_by_tag.dart';
import 'package:flutter/material.dart';
import '../../../../core/domain/entities/all_products_list.dart';
import 'components/product_list_tile.dart';

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tag = ModalRoute.of(context)!.settings.arguments as String;

    final List<Product> productsByTag = getIt<GetProductsByTag>()
        .call(products: getIt<AllProductsList>().products, tag: tag);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tag,
        ),
      ),
      body: ListView.builder(
        itemCount: productsByTag.length,
        itemBuilder: (context, index) {
          return ProductListTile(product: productsByTag[index]);
        },
      ),
    );
  }
}
