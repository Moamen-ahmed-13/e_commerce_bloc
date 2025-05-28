import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/products/models/product_model.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProductFirebaseService {
  Future<Either<String, List<ProductModel>>> getProducts();
  Future<Either<String, List<ProductModel>>> getProductsByTitle(String title);
  Future<Either> addOrRemoveFromFavorite(ProductEntity product);
    Future<bool> isFavorite(String productId);
      Future<Either> getFavoriteProducts();

}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      var snapshot =
          await FirebaseFirestore.instance.collection('Products').get();
      List<ProductModel> products =
          snapshot.docs.map((doc) => ProductModel.fromMap(doc.data())).toList();
      return Right(products);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getProductsByTitle(
      String title) async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('Products')
          .where('title', isGreaterThanOrEqualTo: title)
          .get();
      List<ProductModel> products =
          snapshot.docs.map((doc) => ProductModel.fromMap(doc.data())).toList();
      return Right(products);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> addOrRemoveFromFavorite(ProductEntity product) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: product.productId)
          .get();

      if (products.docs.isNotEmpty) {
        await products.docs.first.reference.delete();
        return Right(false);
      } else {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('Favorites')
            .add(ProductModel.fromEntity(product).toMap());
        return Right(true);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
  
  @override
   Future < bool > isFavorite(String productId) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance.collection(
        "Users"
      ).doc(user!.uid).collection('Favorites').where(
        'productId', isEqualTo: productId
      ).get();

      if (products.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }

    } catch (e) {
      return false;
    }
  }
  
  
  @override
  Future < Either > getFavoriteProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance.collection(
        "Users"
      ).doc(user!.uid).collection('Favorites').get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left(
        'Please try again'
      );
    }
  }


}