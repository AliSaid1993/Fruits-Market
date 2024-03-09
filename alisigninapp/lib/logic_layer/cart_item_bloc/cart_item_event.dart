part of 'cart_item_bloc.dart';

abstract class CartItemEvent extends Equatable {
  const CartItemEvent();

  @override
  List<Object> get props => [];
}

class CartDecrementEvent extends CartItemEvent {
  final String cartid;
  final int productid;
  final int quantity;

  CartDecrementEvent({required this.cartid,required this.productid,required this.quantity});
}