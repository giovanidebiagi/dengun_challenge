import 'package:dartz/dartz.dart';
import 'package:dengun_challenge/core/domain/entities/all_products_list.dart';
import 'package:dengun_challenge/core/domain/usecases/get_products.dart';
import 'package:dengun_challenge/core/errors/failures/i_failure.dart';
import 'package:dengun_challenge/core/injection_container.dart';

import '../../../../core/domain/entities/product.dart';

class GetTags {
  Future<Either<IFailure, List<String>>> call() async {
    final AllProductsList allProductsList = getIt<AllProductsList>();

    if (allProductsList.products.isEmpty) {
      final GetProducts getProducts = getIt<GetProducts>();
      final allProducts = await getProducts();

      IFailure? failure;

      allProducts.fold((l) {
        failure = l;
      }, (r) {
        allProductsList.products.addAll(r);
      });

      if (failure != null) {
        return Left(failure!);
      }
    }

    Set<String> tags = <String>{};

    for (Product product in allProductsList.products) {
      for (String tag in product.tags) {
        tags.add(tag);
      }
    }

    return Right(tags.toList());
  }
}
