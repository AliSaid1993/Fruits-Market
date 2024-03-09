
import 'dart:convert';
import 'package:alisigninapp/models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthRepo {

  signIn(String username,String password) async{
    try{
      var res = await http.post(Uri.parse("https://matjari.app/auth/jwt/create/"),
        headers:{},
        body: {'username':username,'password':password},
      );
      var data = <String,dynamic>{};
      data["status"]=res.statusCode;
      if(res.statusCode==200){
        data["body"]=json.decode(res.body);
        return data;
      }else if(res.statusCode==500){
        return "error from server side";
      }else {

        final data=json.decode(res.body);
        return data;

      }

    }catch(e){
      print(e.toString());
    }
  }
  signup(String username,String firstname,String lastname,String password,String phone,String email) async{
    try{
      var request = new http.MultipartRequest("POST",Uri.parse("https://matjari.app/auth/users/"));
      request.fields["username"]=username;
      request.fields["password"]=password;
      request.fields["email"]=email;
      request.fields["phone"]=phone;
      request.fields["first_name"]=firstname;
      request.fields["last_name"]=lastname;

      var res1 =  await http.Response.fromStream(await request.send());
      var data = jsonDecode(res1.body);
      print(data);
      print(res1.statusCode);
      var user=UserModel.fromJson(data);
      return user;

    }catch(e){
      e.toString();
    }
  }
  Future<UserModel?> getUserInfo() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    var jwt= prefs.getString("access");
    var res = await http.get(Uri.parse("https://matjari.app/auth/users/me")
        , headers: <String, String>{'authorization': "JWT $jwt"}

    );
    if(res.statusCode==200){
      prefs.setString("user", res.body);
      var data =jsonDecode(res.body);
      var user=UserModel.fromJson(data);
      return user;

    }else{
      return null;
    }
  }
}

