part of 'cart_item_bloc.dart';

@immutable
 class CartItemState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw [];
}

class CartItemInitial extends CartItemState {}
class CartLoadingProgressState extends  CartItemState{}

class CartItemLoadedState extends CartItemState{
 final int value;

  CartItemLoadedState(this.value);
}


