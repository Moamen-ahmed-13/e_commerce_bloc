import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/order/models/add_to_cart.dart';
import 'package:e_commerce_bloc/data/order/models/order_registeration_req.dart';
import 'package:e_commerce_bloc/data/order/models/product_ordered.dart';
import 'package:e_commerce_bloc/data/order/source/order_firebase_services.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    return sl<OrderFirebaseServices>().addToCart(addToCartReq);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await sl<OrderFirebaseServices>().getCartProducts();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductOrderedModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> removeCartProducts(String id) async {
    var returnedData = await sl<OrderFirebaseServices>().removeCartProducts(id);
    return returnedData.fold((error) {
      return Left(error);
    }, (message) {
      return Right(message);
    });
  }
  @override
  Future<Either> orderRegistration(OrderRegistrationReq orderRegistrationReq)async {
    var returnedData = await sl<OrderFirebaseServices>().orderRegistration(orderRegistrationReq);
    return returnedData.fold((error) {
      return Left(error);
    }, (message) {
      return Right(message);
    });
  }

  @override
  Future<Either> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }


}
