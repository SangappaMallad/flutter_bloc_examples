import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_api_examples/data/cart_items.dart';
import 'package:bloc_api_examples/features/home/models/home_products_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartIntialEvent>(cartIntialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartIntialEvent(
      CartIntialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productsDataModel);
    emit(CartSuccessState(cartItems: cartItems));
  }
}
