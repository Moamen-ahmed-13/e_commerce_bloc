import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/order/models/add_to_cart.dart';
import 'package:e_commerce_bloc/data/order/source/order_firebase_services.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository{
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async{
   return sl<OrderFirebaseServices>().addToCart(addToCartReq);
  }

  @override
  Future<Either> getCartProducts() {
    // TODO: implement getCartProducts
    throw UnimplementedError();
  }

  @override
  Future<Either> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  @override
  Future<Either> orderRegistration() {
    // TODO: implement orderRegistration
    throw UnimplementedError();
  }

  @override
  Future<Either> removeCartProducts(String id) {
    // TODO: implement removeCartProducts
    throw UnimplementedError();
  }
}