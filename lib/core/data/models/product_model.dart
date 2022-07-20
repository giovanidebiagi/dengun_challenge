import 'package:dengun_challenge/core/data/models/product_variant_model.dart';
import 'package:dengun_challenge/core/domain/entities/product.dart';
import 'package:dengun_challenge/core/domain/entities/product_variant.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.id,
      required super.name,
      required super.variants,
      required super.tags,
      super.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var variantsJson = json['variants'];
    List<String> tags = [];
    List<ProductVariant> variants = [];

    tags = json['tags'].toString().split(', ');

    for (var variant in variantsJson) {
      variants.add(ProductVariantModel.fromJson(variant));
    }

    return ProductModel(
        id: json['id'],
        name: json['title'],
        variants: variants,
        tags: tags,
        imageUrl: '');
  }
}
