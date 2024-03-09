import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_model.dart';

class CartRepository {
  List<Cart> carts = [];
  List<int> recievedUser = [];
  late SharedPreferences prefs;

  Future<Map<String, dynamic>> getCartForUser() async {
    prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('access');
    var str = token!.split(".");
    var payload =
        json.decode(ascii.decode(base64.decode(base64.normalize(str[1]))));
    var res = await http.get(
        Uri.parse(
            'https://matjari.app/store/carts/?user=${payload['user_id']}'),
        // headers: <String, String>{'authorization': "JWT $token"}
        headers: {HttpHeaders.authorizationHeader: 'JWT $token'});
    Map<String, dynamic> data = <String, dynamic>{};
    if (res.statusCode == 200) {
      carts = [];
      var result = json.decode(res.body);
      for (var cart in result) {
        carts.add(Cart.fromJson(cart));
        break;
      }
      data["cart"] = carts;
      return data;
    } else {
      return data;
    }
  }

  Future<bool> addProductToCart(
      int wholesalerId, int productId, List<Cart> carts) async {
    prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('access');
        // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1NzUwNjE1LCJpYXQiOjE2OTQ4ODY2MTUsImp0aSI6IjVhNDJlOGVjNTA0MjQyYzU5MTNmYTA0ZDM3NmMzYzUzIiwidXNlcl9pZCI6MX0.AloELjYY1Mbtt_cnWbU63juhjmu1AiPdx7REK6y9cuk";
    var str = token!.split(".");
    var payload =
        json.decode(ascii.decode(base64.decode(base64.normalize(str[1]))));
    var cartId = '';

    for (var cart in carts) {
      if (cart.recieverUser == wholesalerId) {
        cartId = cart.id!;
        break;
      }
    }
    print(cartId);
    if (cartId == '') {
      var res = await http.post(
        Uri.parse('https://matjari.app/store/carts/'),
        body: {"user": payload["user_id"], "reciever_user": wholesalerId},
        headers: <String, String>{'authorization': "jwt:$token"},
      );
      if (res.statusCode == 201) {
        var data = json.decode(res.body);
        cartId = data['id'];
        return true;
      } else {
        return false;
      }
    } else {
      var response = await http.post(
          Uri.parse('https://matjari.app/store/carts/$cartId/items/'),
          body: jsonEncode({"product_id": productId, "quantity": 1}),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'JWT $token'
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<int> decrementItemFromCart(
      String cartId, int itemId, int quantity) async {
    prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('access');
    print(token);
    var response = await http.patch(
      Uri.parse(
          'https://matjari.app/store/carts/$cartId/items/${itemId.toString()}/'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'JWT $token'
      },
      body: jsonEncode({'quantity': quantity}),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['quantity'];
    } else {
      return -1;
    }
  }
}
