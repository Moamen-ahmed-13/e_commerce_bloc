import 'package:e_commerce_bloc/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce_bloc/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce_bloc/data/category/repository/category_repo_impl.dart';
import 'package:e_commerce_bloc/data/category/source/category_firebase_service.dart';
import 'package:e_commerce_bloc/data/products/repository/product_repo_impl.dart';
import 'package:e_commerce_bloc/data/products/source/product_firebase_service.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/get_ages.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/get_user.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/is_logged_in.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/reset_password_usecase.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/signin_usecase.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/signup_usecase.dart';
import 'package:e_commerce_bloc/domain/category/repository/category_repo.dart';
import 'package:e_commerce_bloc/domain/category/usecases/get_categories.dart';
import 'package:e_commerce_bloc/domain/products/repository/product_repo.dart';
import 'package:e_commerce_bloc/domain/products/usecases/get_product.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );
  sl.registerSingleton<CategoryFirebaseService>(
    CategoryFirebaseServiceImpl(),
  );
  sl.registerSingleton<ProductFirebaseService>(
    ProductFirebaseServiceImpl(),
  );

  // Repositories

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );
  sl.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl(),
  );
  sl.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(),
  );

  // UseCases

  sl.registerSingleton<SigninUsecase>(
    SigninUsecase(),
  );
  sl.registerSingleton<SignupUsecase>(
    SignupUsecase(),
  );
  sl.registerSingleton<GetAgesUseCase>(
    GetAgesUseCase(),
  );
  sl.registerSingleton<ResetPasswordUsecase>(
    ResetPasswordUsecase(),
  );
  sl.registerSingleton<IsLoggedInUsecase>(
    IsLoggedInUsecase(),
  );
  sl.registerSingleton<GetUserUsecase>(
    GetUserUsecase(),
  );
  sl.registerSingleton<GetCategoriesUsecase>(
    GetCategoriesUsecase(),
  );
  sl.registerSingleton<GetProductUsecase>(
    GetProductUsecase(),
  );
}
