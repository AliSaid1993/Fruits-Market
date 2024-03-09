part of 'category_bloc.dart';

 class CategoryState extends Equatable {
  const CategoryState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class CategoryInitial extends CategoryState {}

class CategoryLoadProgressState extends CategoryState{}

class CategoryLoadedSuccessState extends CategoryState{
  List<Category> categories;
  CategoryLoadedSuccessState({required this.categories});
}

class CategoryFailureState extends CategoryState{
  var msg;
  CategoryFailureState({required this.msg});
}
class CategoryErrorState extends CategoryState{
  var msg;
  CategoryErrorState({required this.msg});
}