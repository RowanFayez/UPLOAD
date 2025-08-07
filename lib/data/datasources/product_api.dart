import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/product.dart';
import '../models/cart.dart';

part 'product_api.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com/')
abstract class ProductApi {
  factory ProductApi(Dio dio, {String baseUrl}) = _ProductApi;

  @GET('/products')
  Future<List<Product>> getProducts();

  @GET('/products/categories')
  Future<List<String>> getCategories();

  @GET('/products/category/{category}')
  Future<List<Product>> getProductsByCategory(@Path('category') String category);

  @GET('/carts')
  Future<List<Cart>> getCarts();

  @GET('/carts/{id}')
  Future<Cart> getCart(@Path('id') int id);

  @POST('/carts')
  Future<Cart> createCart(@Body() Map<String, dynamic> cartData);

  @PUT('/carts/{id}')
  Future<Cart> updateCart(@Path('id') int id, @Body() Map<String, dynamic> cartData);

  @DELETE('/carts/{id}')
  Future<Cart> deleteCart(@Path('id') int id);
}
