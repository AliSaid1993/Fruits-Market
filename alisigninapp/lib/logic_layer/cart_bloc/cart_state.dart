part of 'cart_bloc.dart';

abstract class VendorCartState extends Equatable {
  const VendorCartState();

  @override
  List<Object> get props => [];
}

class VendorCartInitial extends VendorCartState {}

class VendorCartLoadingProgressState extends VendorCartState {}

class VendorCartLoadedState extends VendorCartState {
  final List<Cart> carts;

  const VendorCartLoadedState(this.carts);
}
