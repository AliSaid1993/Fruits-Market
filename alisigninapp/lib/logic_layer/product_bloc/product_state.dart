part of 'product_bloc.dart';

 class ProductState extends Equatable {
  const ProductState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductInitial extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductLoadProgressState extends ProductState{}
class ProductLoadProgressSearchState extends ProductState{
    // Product productFromSearch;
    // ProductLoadProgressSearchState({required this.productFromSearch});
}
class ProducrLoadedSuccessState extends ProductState {
  List<Product> products;
  ProducrLoadedSuccessState({required this.products});
}
class ProductErrorState extends ProductState{
  String msg;
  ProductErrorState({required this.msg});

}
class ProductFailureState extends ProductState{
  String msg;
  ProductFailureState({required this.msg});

}
