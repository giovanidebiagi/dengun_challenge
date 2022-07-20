import 'package:dengun_challenge/core/domain/entities/product_variant.dart';

class Product {
  final int id;
  final String name;
  final List<String> tags;
  final List<ProductVariant> variants;
  String imageUrl;

  Product(
      {required this.id,
      required this.name,
      required this.tags,
      required this.variants,
      this.imageUrl = ''});
}
