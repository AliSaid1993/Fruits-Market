import 'dart:convert';

import 'package:alisigninapp/models/product_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Product_Repo {
  final _url = "https://matjari.app/store/products/";
  final _categoryFilter =
      "https://matjari.app/store/products/?category_id=4&unit_price__lt=&unit_price__gt=";
  List<Product> products = [];
  List<Product> cartItems = [];

  Future<dynamic> getProduct() async {
    try {
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data["results"]);
        for (var element in data["results"]) {
          products.add(Product.fromJson(element));
        }
        return products;
      } else {
        return 'errrrrrrrror';
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<dynamic> filterproduct(int categoryId) async {
    try {
      var response;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("access");
      print("response.statusCode");

      if (categoryId == 0) {
        response = await http.get(Uri.parse(_url),
            headers: <String, String>{'authorization': "JWT $token"});
      } else {
        response = await http.get(
            Uri.parse(
                "https://matjari.app/store/products/?category_id=${categoryId}&unit_price__lt=&unit_price__gt="),
            headers: <String, String>{'authorization': "JWT $token"});
      }
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data["results"]);
        products = [];
        for (var element in data["results"]) {
          products.add(Product.fromJson(element));
        }
        return products;
      } else {
        return "errorrrrrrrrr";
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<dynamic> searchInProducts(String query) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("access");
      print("response.statusCode");
      var results = await http.get(
          Uri.parse(
              "https://matjari.app/store/products/?search=$query"),
            headers: <String, String>{
              'authorization': "JWT $token"
            } // key for this endpoint
      );
      if (results.statusCode == 200) {
        var data = json.decode(results.body);
        print(data["results"]);
        products = [];
        for (var element in data["results"]) {
          products.add(Product.fromJson(element));
        }
        return products;
      } else {
        return "errorrrrrrrrr";
      }
    } catch (e) {
      e.toString();
    }
  }
  //
  // Future<dynamic> postCartProduct(int productId,String username,String recieveruser) async {
  //   try {
  //     String cart ="";
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var token = prefs.getString('access');
  //     cart = prefs.getString('cart')??'';
  //     if(cart.isEmpty){
  //       var request = await http.post(Uri.parse("https://matjari.app/store/carts/"),
  //         headers:{},
  //         body: {'username':username,'recieveruser':recieveruser},
  //       );
  //       if(request.statusCode==200) {
  //        await prefs.setString('cart', '00b36b9d-81a5-4343-8af8-0e691a8da11f');
  //       }
  //        var data=json.decode(request.body);
  //        for (var element in data['results']) {
  //          cartItems.add(Product.fromJson(element));
  //       }
  //     }else{
  //       var cardid=prefs.getString('cart');
  //       var res=http.get(Uri.parse('https://matjari.app/store/carts/$cardid'));
  //     }
  //
  //       return cartItems;
  //     }
  //   } catch (e) {
  // e.toString();
  // }
  //   Future<dynamic> removeFromCart(int productId) async {
  //     try{
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       var token = prefs.getString('access');
  //       var res = await http.delete(
  //           Uri.parse("https://matjari.app/store/products/$productId"),
  //           headers:<String,String>{'authorization': "jwt $token"}
  //       );
  //       if(res.statusCode==200){
  //         var data=json.decode(res.body);
  //         for(var element in data){
  //           cartItems.remove(Product.fromJson(element));
  //         }
  //         return cartItems;
  //       }
  //     }catch(e){
  //       e.toString();
  //     }
  //    }
  }

