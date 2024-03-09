part of 'product_bloc.dart';

 class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class LoadProductEvent extends ProductEvent{}
class SelectCategoryToFilterProducts extends ProductEvent{
  final int categoryId;
  SelectCategoryToFilterProducts({required this.categoryId});
}

class SearchForSomeProduct extends ProductEvent{
   final String query;
   const SearchForSomeProduct({required this.query});
}
