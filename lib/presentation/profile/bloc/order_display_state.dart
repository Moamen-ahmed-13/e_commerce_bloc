import 'package:e_commerce_bloc/domain/order/entity/order_entity.dart';

abstract class OrdersDisplayState {}

class OrdersDisplayInitial extends OrdersDisplayState {}

class OrdersDisplayLoaded extends OrdersDisplayState {
  final List<OrderEntity> orders;
  OrdersDisplayLoaded(this.orders);
}

class OrdersDisplayLoading extends OrdersDisplayState {}

class OrdersDisplayError extends OrdersDisplayState {
  final String errorMessage;
  OrdersDisplayError(this.errorMessage);
}
