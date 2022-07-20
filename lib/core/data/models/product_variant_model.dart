import 'package:dengun_challenge/core/domain/entities/product_variant.dart';

class ProductVariantModel extends ProductVariant {
  ProductVariantModel({required super.inventoryQuantity});

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) {
    return ProductVariantModel(inventoryQuantity: json['inventory_quantity']);
  }
}
