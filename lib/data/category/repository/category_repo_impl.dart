import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/category/models/category_model.dart';
import 'package:e_commerce_bloc/data/category/source/category_firebase_service.dart';
import 'package:e_commerce_bloc/domain/category/repository/category_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();
    return categories.fold((error) {
      return Left(error);
    }, (data) {
      return Right( List.from(data).map((e) => CategoryModel.fromMap(e)).toList());
      
    },);
  }
}
