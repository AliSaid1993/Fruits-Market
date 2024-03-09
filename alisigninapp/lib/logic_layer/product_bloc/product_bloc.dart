import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/product_model.dart';
import '../../repositories/product_repo.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  Product_Repo repo;

  ProductBloc(this.repo) : super(ProductInitial()) {
    on<LoadProductEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProductLoadProgressState());
      try {
        var products = await repo.filterproduct(0);
        if (products == "error") {
          emit(ProductErrorState(msg: "error"));
        } else {
          emit(ProducrLoadedSuccessState(products: products));
        }
      } catch (e) {
        e.toString();
        emit(ProductErrorState(msg: "error"));
      }
    });
    on<SelectCategoryToFilterProducts>(
      (event, emit) async {
        emit(ProductLoadProgressState());
        try {
          var products = await repo.filterproduct(event.categoryId);
          if (products == "error") {
            emit(ProductErrorState(msg: "error"));
          } else {
            emit(ProducrLoadedSuccessState(products: products));
          }
        } catch (e) {
          e.toString();
        }
      },
    );
    on<SearchForSomeProduct>(
      (event, emit) async {
        emit(ProductLoadProgressState());
        try {
          var products = await repo.searchInProducts(event.query);
          if (products == "error") {
            emit(ProductErrorState(msg: "error"));
          } else {
            emit(ProducrLoadedSuccessState(products: products));
          }
        } catch (e) {
          e.toString();
        }
      },
    );
  }
}
