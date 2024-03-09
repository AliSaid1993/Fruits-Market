import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repositories/cart_repository.dart';

part 'cart_item_event.dart';
part 'cart_item_state.dart';

class CartItemBloc extends Bloc<CartItemEvent, CartItemState> {
  late CartRepository cartRepository;

  CartItemBloc({required this.cartRepository}) : super(CartItemInitial()) {
    on<CartDecrementEvent>((event, emit) async {
      // TODO: implement event handler
      emit(CartLoadingProgressState());
      try {
        var value = await cartRepository.decrementItemFromCart(
            event.cartid, event.productid, event.quantity);
        if(value !=-1){
          emit(CartItemLoadedState(value));
        }
      } catch (e) {
        print("eeeeeeeeeeeeeeeeee");
        print(e.toString());

      }
    });
  }
}
