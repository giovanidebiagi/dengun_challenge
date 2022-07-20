import 'package:dengun_challenge/core/domain/entities/product_variant.dart';
import '../../../../core/domain/entities/product.dart';

class GetVariantsTotalInventoryQuantity {
  int call({required Product product}) {
    int quantity = 0;

    for (ProductVariant productVariant in product.variants) {
      quantity += productVariant.inventoryQuantity;
    }

    return quantity;
  }
}
