part of 'cart_bloc.dart';


abstract class VendorCartEvent extends Equatable {
  const VendorCartEvent();

  @override
  List<Object> get props => [];
}

class VendorCartLoadEvent extends VendorCartEvent {}

class VendorCartAddProductEvent extends VendorCartEvent {
  final int wholesalerId;
  final int productId;

  const VendorCartAddProductEvent(this.wholesalerId, this.productId);
}
abstract class VendorCartDecrementItemsEvent extends VendorCartEvent {
   final int wholesalerId;
  final int productId;
  final int quantity;

  const VendorCartDecrementItemsEvent(this.wholesalerId, this.productId,this.quantity);
}