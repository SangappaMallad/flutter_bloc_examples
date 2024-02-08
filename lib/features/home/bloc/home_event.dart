part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeIntialEvent extends HomeEvent {}

class HomeProductsWishlistButtonClickedEvent extends HomeEvent {
  final ProductsDataModel clickedProducts;

  HomeProductsWishlistButtonClickedEvent({required this.clickedProducts});
}

class HomeProductsCartButtonClickedEvent extends HomeEvent {
  final ProductsDataModel clickedProducts;

  HomeProductsCartButtonClickedEvent({required this.clickedProducts});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
