// cart_model.dart
//
// class Cart {
// String? id;
// List<Items>? items;
// double? totalPrice;
// int? user;
// int? recieverUser;
//
// Cart({this.id, this.items, this.totalPrice, this.user, this.recieverUser});
//
// Cart.fromJson(Map<String, dynamic> json) {
// id = json['id'];
// if (json['items'] != null) {
// items = <Items>[];
// json['items'].forEach((v) {
// items!.add(new Items.fromJson(v));
// });
// }
// totalPrice = json['total_price'];
// user = json['user'];
// recieverUser = json['reciever_user'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['id'] = this.id;
// if (this.items != null) {
// data['items'] = this.items!.map((v) => v.toJson()).toList();
// }
// data['total_price'] = this.totalPrice;
// data['user'] = this.user;
// data['reciever_user'] = this.recieverUser;
// return data;
// }
// }
//
// class Items {
// int? id;
// CartProduct? product;
// int? quantity;
// double? totalPrice;
//
// Items({this.id, this.product, this.quantity, this.totalPrice});
//
// Items.fromJson(Map<String, dynamic> json) {
// id = json['id'];
// product = json['product'] != null
// ? new CartProduct.fromJson(json['product'])
//     : null;
// quantity = json['quantity'];
// totalPrice = json['total_price'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['id'] = this.id;
// if (this.product != null) {
// data['product'] = this.product!.toJson();
// }
// data['quantity'] = this.quantity;
// data['total_price'] = this.totalPrice;
// return data;
// }
// }
//
// class CartProduct {
// int? id;
// String? title;
// double? unitPrice;
//
// CartProduct({this.id, this.title, this.unitPrice});
//
// CartProduct.fromJson(Map<String, dynamic> json) {
// id = json['id'];
// title = json['title'];
// unitPrice = json['unit_price'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['id'] = this.id;
// data['title'] = this.title;
// data['unit_price'] = this.unitPrice;
// return data;
// }
// }
//
// cart_repository.dart
//
// import 'dart:convert';
//
// import 'package:matjarie_mobile/data/models/cart_model.dart';
// import 'package:matjarie_mobile/helpers/http_helper.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CartRepository {
// List<Cart> carts = [];
// List<int> recievedUser = [];
// late SharedPreferences prefs;
//
// Future<Map<String, dynamic>> getCartsForUser() async {
// prefs = await SharedPreferences.getInstance();
// var jwt = prefs.getString("token");
// var str = jwt!.split(".");
// var payload =
// json.decode(ascii.decode(base64.decode(base64.normalize(str[1]))));
// var rs = await HttpHelper.get("$CARTS_ENDPOINT?user=${payload["user_id"]}", apiToken: jwt);
// Map<String, dynamic> data = <String, dynamic>{};
// if (rs.statusCode == 200) {
// carts = [];
// var result = jsonDecode(rs.body);
//
// for (var cart in result) {
// carts.add(Cart.fromJson(cart));
// recievedUser.add(cart["reciever_user"]);
// }
// data["cart"] = carts;
// data["reciever_user"] = recievedUser;
// return data;
// }
// return data;
// }
//
// Future<bool> addProductToCart(int wholesalerId, int productId, List<Cart> carts) async {
//
//   prefs = await SharedPreferences.getInstance();
// var jwt = prefs.getString("token");
// var str = jwt!.split(".");
// var payload =
// json.decode(ascii.decode(base64.decode(base64.normalize(str[1]))));
// var cartId = "";
//
// for (var cart in carts) {
// if (cart.recieverUser! == wholesalerId) {
// cartId = cart.id!;
// break;
// }
// }
// if (cartId == "") {
// var rs = await HttpHelper.post(CARTS_ENDPOINT,
// {"user": payload["user_id"], "reciever_user": wholesalerId},
// apiToken: jwt);
// if (rs.statusCode == 201) {
// var jsonObject = jsonDecode(rs.body);
// cartId = jsonObject["id"];
// }
// }
//
// var response = await HttpHelper.post('$CARTS_ENDPOINT$cartId/items/',
// {"product_id": productId, "quantity": 1},
// apiToken: jwt);
//
// if (response.statusCode == 201) {
// return true;
// } else {
// return false;
// }
// }
// }
//
// cart_state
//
// part of 'vendor_cart_bloc.dart';
//
// abstract class VendorCartState extends Equatable {
// const VendorCartState();
//
// @override
// List<Object> get props => [];
// }
//
// class VendorCartInitial extends VendorCartState {}
//
// class VendorCartLoadingProgressState extends VendorCartState {}
//
// class VendorCartLoadedState extends VendorCartState {
// final List<Cart> carts;
// final List<int> recieverUser;
//
// const VendorCartLoadedState(this.carts, this.recieverUser);
// }
//
// حيدرة يوسف, [9/1/2023 4:20 PM]
// cart event
//
// part of 'vendor_cart_bloc.dart';
//
// abstract class VendorCartEvent extends Equatable {
// const VendorCartEvent();
//
// @override
// List<Object> get props => [];
// }
//
// class VendorCartLoadEvent extends VendorCartEvent {}
//
// class VendorCartAddProductEvent extends VendorCartEvent {
// final int wholesalerId;
// final int productId;
//
// VendorCartAddProductEvent(this.wholesalerId, this.productId);
// }
//
// حيدرة يوسف, [9/1/2023 4:20 PM]
// cart  bloc
//
// حيدرة يوسف, [9/1/2023 4:20 PM]
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:matjarie_mobile/data/models/cart_model.dart';
// import 'package:matjarie_mobile/data/repositories/cart_repository.dart';
//
// part 'vendor_cart_event.dart';
// part 'vendor_cart_state.dart';
//
// class VendorCartBloc extends Bloc<VendorCartEvent, VendorCartState> {
// final CartRepository cartRepository;
//
// VendorCartBloc({required this.cartRepository}) : super(VendorCartInitial()) {
// on<VendorCartLoadEvent>((event, emit) async {
// emit(VendorCartLoadingProgressState());
// try {
// var data = await cartRepository.getCartsForUser();
// emit(VendorCartLoadedState(data["cart"], data["reciever_user"]));
// } catch (e) {}
// });
//
// on<VendorCartAddProductEvent>((event, emit) async {
// VendorCartLoadedState currentState = state as VendorCartLoadedState;
//
// emit(VendorCartLoadingProgressState());
// try {
// var value = await cartRepository.addProductToCart(
// event.wholesalerId, event.productId, currentState.carts);
// if (value) {
// var data = await cartRepository.getCartsForUser();
// emit(VendorCartLoadedState(data["cart"], data["reciever_user"]));
// } else {}
// } catch (e) {}
// });
// }
// }