import 'package:dartz/dartz.dart';
import 'package:dengun_challenge/core/domain/repositories/i_products_repository.dart';
import 'package:dengun_challenge/core/errors/failures/i_failure.dart';

class SetProductFirstImageUrl {
  final IProductsRepository repository;

  SetProductFirstImageUrl({required this.repository});

  Future<Either<IFailure, String>> call({required int productId}) async {
    return await repository.getProductFirstImageUrl(productId: productId);
  }
}
