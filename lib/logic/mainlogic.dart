import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Mainlogic{
  //final FirebaseMessaging fire = FirebaseMessaging.instance;
  var message ;
  var data;
  var profile;
  Future login(phone ,password)async{
      var data = {"password": password, "phone": phone , "token" :""};
      //put here the url to add account
      var url = "https://filtery-eg.com/api/auth/login";
      var response = await http.post(Uri.parse(url), body: data);
      var body = jsonDecode(response.body);
      if(body["message"]=="login Successfuly") {
        SharedPreferences sharedPreferences = await SharedPreferences
            .getInstance();
        sharedPreferences.setString("token", body["data"]["access_token"]);
      }
      message = body["message"];
      print(body["data"]["access_token"]);
      return body["message"];
    }
  Future getprofile()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var url = "https://filtery-eg.com/api/auth/profile";
    var response = await http.get(Uri.parse(url),
        headers: {
          //'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    var body = jsonDecode(response.body);
    profile = body["data"];
    return body["data"];
  }
  getdata() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("basket", "null");
    var phone =   sharedPreferences.getString("phone");
    var token = sharedPreferences.getString("token");
    var password = sharedPreferences.getString("password");
    var type = sharedPreferences.getString("logintype");
    data ={
      "phone" : phone , "password" : password , "logintype" : type , "token" : token
    };
    return data ;
  }
}