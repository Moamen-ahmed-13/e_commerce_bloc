import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/order/models/add_to_cart.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseServices {
  Future<Either> addToCart(AddToCartReq addToCartReq);
  Future<Either> getCartProducts();
}

class OrderFirebaseServicesImpl implements OrderFirebaseServices {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .add(addToCartReq.toMap());
      return Right('Product added to cart');
    } catch (e) {
      return Left('Please try again');
    }
  }

 @override
  Future<Either> getCartProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance.collection(
        'Users'
      ).doc(user!.uid).collection('Cart').get();
      
      List<Map> products = [];
      for(var item in returnedData.docs){
        var data = item.data();
        data.addAll({'id' : item.id});
        products.add(data);
      }
      return Right(products);
    } catch (e) {
      return const Left(
        'Please try again'
      );

    }
  }
}
