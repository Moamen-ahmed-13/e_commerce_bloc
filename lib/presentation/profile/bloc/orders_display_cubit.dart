import 'package:e_commerce_bloc/domain/order/usecases/get_orders.dart';
import 'package:e_commerce_bloc/presentation/profile/bloc/order_display_state.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersDisplayCubit extends Cubit<OrdersDisplayState> {
  OrdersDisplayCubit() : super(OrdersDisplayLoading());

  void displayOrders() async {
    var returnedData = await sl<GetOrdersUsecase>().call();
    returnedData.fold((error) => emit(OrdersDisplayError(error)),
        (data) => emit(OrdersDisplayLoaded(data)));
  }
}
