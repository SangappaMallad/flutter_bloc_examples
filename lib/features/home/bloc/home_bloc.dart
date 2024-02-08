import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_api_examples/data/cart_items.dart';
import 'package:bloc_api_examples/data/grocery_data.dart';
import 'package:bloc_api_examples/data/wishlist_items.dart';
import 'package:bloc_api_examples/features/home/models/home_products_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeIntialEvent>(homeIntialEvent);
    on<HomeProductsWishlistButtonClickedEvent>(
        homeProductsWishlistButtonClickedEvent);
    on<HomeProductsCartButtonClickedEvent>(homeProductsCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  FutureOr<void> homeIntialEvent(
      HomeIntialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductsDataModel(
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imagUrl: e['image']))
            .toList()));
  }

  FutureOr<void> homeProductsWishlistButtonClickedEvent(
      HomeProductsWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('wishlist products clicked');

    wishlistItems.add(event.clickedProducts);
    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeProductsCartButtonClickedEvent(
      HomeProductsCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('cart products clicked');
    cartItems.add(event.clickedProducts);
    emit(HomeProductItemCartListedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('wishlist navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('cart navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}
