import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/category_model.dart';
import '../../repositories/categoiry_repo.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  Category_Repo repo;

  CategoryBloc(this.repo) : super(CategoryInitial()) {
    on<LoadCategoriesEvent>((event, emit) async {
      // TODO: implement event handler
      emit(CategoryLoadProgressState());
      try {
        var categories = await repo.getGategory();
        if (categories == "error") {
          emit(CategoryFailureState(msg: "error"));
        }else
          {
            emit(CategoryLoadedSuccessState(categories: categories));
          }
      } catch (e) {
        e.toString();
      }
    });
  }
}
