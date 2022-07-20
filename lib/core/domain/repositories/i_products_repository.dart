import 'package:dartz/dartz.dart';
import 'package:dengun_challenge/core/domain/entities/product.dart';
import 'package:dengun_challenge/core/errors/failures/i_failure.dart';

abstract class IProductsRepository {
  Future<Either<IFailure, List<Product>>> getProducts();
  Future<Either<IFailure, String>> getProductFirstImageUrl(
      {required int productId});
}
