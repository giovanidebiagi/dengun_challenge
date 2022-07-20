import '../../../../core/domain/entities/product.dart';

class GetProductsByTag {
  List<Product> call({required List<Product> products, required String tag}) {
    return products.where((element) => element.tags.contains(tag)).toList();
  }
}
