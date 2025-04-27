import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/products/models/product_model.dart';

abstract class ProductFirebaseService {
  Future<Either<String, List<ProductModel>>> getProducts();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('Products').get();
      List<ProductModel> products = snapshot.docs.map((doc) => ProductModel.fromMap(doc.data())).toList();
      return Right(products);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
