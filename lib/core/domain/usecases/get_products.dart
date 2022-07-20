import 'package:dartz/dartz.dart';
import 'package:dengun_challenge/core/domain/entities/product.dart';
import 'package:dengun_challenge/core/domain/repositories/i_products_repository.dart';
import 'package:dengun_challenge/core/errors/failures/i_failure.dart';

class GetProducts {
  final IProductsRepository repository;

  GetProducts({required this.repository});

  Future<Either<IFailure, List<Product>>> call() async {
    return await repository.getProducts();
  }
}
