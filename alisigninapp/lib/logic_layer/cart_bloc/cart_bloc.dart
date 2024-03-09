import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';
import '../../models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';
class VendorCartBloc extends Bloc<VendorCartEvent, VendorCartState>    {
  final CartRepository cartRepository;
  VendorCartBloc({required this.cartRepository}) : super(VendorCartInitial()) {
    on<VendorCartLoadEvent>((event, emit) async {
      emit(VendorCartLoadingProgressState());
      try {
        var data = await cartRepository.getCartForUser();
        emit(VendorCartLoadedState(data["cart"]));
      } catch (e) {
        print("eeeeeeeeeeeeeeeeee");
        print(e.toString());

      }
    });

    on<VendorCartAddProductEvent>((event, emit) async {
      VendorCartLoadedState currentState = state as VendorCartLoadedState;

      emit(VendorCartLoadingProgressState());
      try {
        var value = await cartRepository.addProductToCart(
            event.wholesalerId, event.productId, currentState.carts);
        if (value) {
          var data = await cartRepository.getCartForUser();
          emit(VendorCartLoadedState(data["cart"]));
        } else {}
      } catch (e) {
      }
    });

  }
}