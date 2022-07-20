import 'package:dartz/dartz.dart' as dartz;
import 'package:dengun_challenge/core/injection_container.dart';
import 'package:dengun_challenge/features/products_list/domain/usecases/set_product_first_image_url.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/domain/entities/product.dart';
import '../../../../../core/errors/failures/server_failure.dart';
import '../../../domain/usecases/get_variants_total_inventory_quantity.dart';

class ProductListTile extends StatefulWidget {
  const ProductListTile({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductListTile> createState() => _ProductListTileState();
}

class _ProductListTileState extends State<ProductListTile> {
  late Future setProductFirstImageUrlFuture;

  @override
  void initState() {
    setProductFirstImageUrlFuture =
        getIt<SetProductFirstImageUrl>().call(productId: widget.product.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FutureBuilder(
        future: setProductFirstImageUrlFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading...');
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                late Widget widgetToBeDisplayed;
                final tags = snapshot.data as dartz.Either;

                tags.fold((l) {
                  if (l is ServerFailure) {
                    widgetToBeDisplayed =
                        const Text('There has been a ServerFailure');
                  } else {
                    widgetToBeDisplayed =
                        const Text('There has been an unknown error');
                  }
                }, (r) {
                  widgetToBeDisplayed = Image.network(r);
                });

                return widgetToBeDisplayed;
              }
          }
        },
      ),
      title: Text(widget.product.name),
      subtitle: Text(
          'Total inventory quantity: ${getIt<GetVariantsTotalInventoryQuantity>().call(product: widget.product).toString()}'),
    );
  }
}
