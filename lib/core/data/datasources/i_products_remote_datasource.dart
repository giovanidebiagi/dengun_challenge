import 'package:dengun_challenge/core/domain/entities/product.dart';

abstract class IProductsRemoteDatasource {
  Future<List<Product>> getProducts();
  Future<String> getProductFirstImageUrl({required int productId});
}
