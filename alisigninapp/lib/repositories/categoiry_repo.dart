import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/category_model.dart';


class Category_Repo {

  final _url="https://matjari.app/store/categories";
  List<Category> catgories=[];
    Future<dynamic> getGategory() async {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var token = prefs.getString("access");
        final response = await http.get(Uri.parse(_url), headers: <String, String>{'authorization': "JWT $token"});
        if(response.statusCode==200){
          var data=json.decode(response.body);
          for(var element in data){
            catgories.add(Category.fromJson(element));
          }
          if(catgories.length>0){
          var defualtCategory=Category(id: 0,title: 'All',productCount: 0);
          catgories.insert(0, defualtCategory);
          }
          return catgories;
        }else{
          return "error";
        }
      }catch(e){
        e.toString();
      }
  }
}