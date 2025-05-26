import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/order/models/add_to_cart.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_ordered.dart';

abstract class OrderRepository {
  Future<Either> addToCart(AddToCartReq addToCartReq);
  Future<Either> getCartProducts();
  Future<Either> removeCartProducts(String id);
  Future<Either> orderRegistration();
  Future<Either> getOrders();
  
}