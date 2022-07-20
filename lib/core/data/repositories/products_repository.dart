import 'package:dengun_challenge/core/data/datasources/i_products_remote_datasource.dart';
import 'package:dengun_challenge/core/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:dengun_challenge/core/domain/repositories/i_products_repository.dart';
import 'package:dengun_challenge/core/errors/exceptions/server_exception.dart';
import 'package:dengun_challenge/core/errors/failures/i_failure.dart';
import 'package:dengun_challenge/core/errors/failures/parsing_failure.dart';
import 'package:dengun_challenge/core/errors/failures/server_failure.dart';

class ProductsRepository implements IProductsRepository {
  final IProductsRemoteDatasource productsRemoteDatasource;

  ProductsRepository({required this.productsRemoteDatasource});

  @override
  Future<Either<IFailure, List<Product>>> getProducts() async {
    List<Product> products;

    try {
      products = await productsRemoteDatasource.getProducts();
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ParsingFailure());
    }

    return Right(products);
  }

  @override
  Future<Either<IFailure, String>> getProductFirstImageUrl(
      {required int productId}) async {
    String imageUrl;

    try {
      imageUrl = await productsRemoteDatasource.getProductFirstImageUrl(
          productId: productId);
    } on ServerException {
      return Left(ServerFailure());
    }

    return Right(imageUrl);
  }
}
