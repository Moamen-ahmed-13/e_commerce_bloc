
import 'package:e_commerce_bloc/domain/category/usecases/get_categories.dart';
import 'package:e_commerce_bloc/presentation/categories/categories_bloc/categories_display_state.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState>{
  CategoriesDisplayCubit():super(CategoriesDisplayLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUsecase>().call();
    returnedData.fold((error) => emit(CategoriesDisplayError(message: error)), (data) => emit(CategoriesDisplayLoaded(categories: data)));
  } 
}