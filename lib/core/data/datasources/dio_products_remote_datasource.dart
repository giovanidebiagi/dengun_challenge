import 'package:dengun_challenge/core/data/datasources/i_products_remote_datasource.dart';
import 'package:dengun_challenge/core/data/models/product_model.dart';
import 'package:dengun_challenge/core/domain/entities/product.dart';
import 'package:dengun_challenge/core/errors/exceptions/server_exception.dart';
import 'package:dio/dio.dart';

const remoteProductsBaseUrl =
    'https://shopicruit.myshopify.com/admin/api/2021-01/';
const remoteProductsUrl =
    '${remoteProductsBaseUrl}products.json?access_token=c32313df0d0ef512ca64d5b336a0d7c6';

class DioProductsRemoteDatasource implements IProductsRemoteDatasource {
  final Dio dio;

  DioProductsRemoteDatasource({required this.dio});

  @override
  Future<List<Product>> getProducts() async {
    try {
      List<Product> products = [];

      final response = await dio.get(remoteProductsUrl);

      for (var productJson in response.data['products']) {
        products.add(ProductModel.fromJson(productJson));
      }

      return products;
    } on DioError {
      throw ServerException();
    }
  }

  @override
  Future<String> getProductFirstImageUrl({required int productId}) async {
    try {
      String imageUrl = '';

      final response = await dio.get(
          '${remoteProductsBaseUrl}products/$productId/images.json?access_token=c32313df0d0ef512ca64d5b336a0d7c6');

      imageUrl = response.data['images'][0]['src'];

      return imageUrl;
    } catch (e) {
      throw ServerException();
    }
  }
}
