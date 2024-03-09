import 'cart_items_models.dart';

class Cart {
  String? id;
  List<Items>? items;
  double? totalPrice;
  int? user;
  int? recieverUser;

  Cart({this.id, this.items, this.totalPrice, this.user, this.recieverUser});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalPrice = json['total_price']==0?0.0:json['total_price'];
    user = json['user'];
    recieverUser = json['reciever_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = this.totalPrice;
    data['user'] = this.user;
    data['reciever_user'] = this.recieverUser;
    return data;
  }
}

class CartProduct {
  int? id;
  String? title;
  double? unitPrice;

  CartProduct({this.id, this.title, this.unitPrice});

  CartProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    unitPrice = json['unit_price']==0?0.0:json['unit_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['unit_price'] = this.unitPrice;
    return data;
  }
}


class Items {
  int? id;
  CartProduct? product;
  int? quantity;
  double? totalPrice;

  Items({this.id, this.product, this.quantity, this.totalPrice});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'] != null
        ? new CartProduct.fromJson(json['product'])
        : null;
    quantity = json['quantity'];
    totalPrice = json['total_price']==0?0.0:json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
