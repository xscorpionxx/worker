import 'dart:convert';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flattery2/screens/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class Loginlogic{
  var contexta;
  Loginlogic(BuildContext context){
    contexta = context;
  }
  String validatpassword(String value) {
  if(value.isEmpty){
      return 'لا يمكن أن تكون كلمة السر فارغة' ;
    }
    return null;
  }
   String validatphone(String value) {
    if(value.isEmpty){
      return 'لا يجب أن يكون الرقم فارغ';
    }
    return null;
  }
  void navigate(){
    Navigator.of(contexta).popUntil((route) => route.isFirst);
    Navigator.of(contexta).pushReplacement(MaterialPageRoute(builder: (context){
      return Mainpage();
    }));
  }
  void alert(message){
    showDialog(context: contexta, builder: (context) {
      return AlertDialog(
          content: Directionality(textDirection: TextDirection.rtl,child:Text(message)),
          actions: [
            new ElevatedButton(onPressed:(){Navigator.of(context).pop();}, child: Text("نعم")),
          ]);
    });
  }
  Loginnow() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var type =  sharedPreferences.getString("logintype");
    if(type =="google"){

    }
    else{

    }
  }
  Future loginfacebookgoogle(type,token)async{
    //put here the url to add account
    var url;
    if(type == "google"){
      url = "https://filtery-eg.com/api/auth/callback/google/"+token.toString();
    }
    else{
      url = "https://filtery-eg.com/api/auth/callback/facebook/"+token.toString();
    }
    var response = await http.post(Uri.parse(url));
    Navigator.of(contexta,rootNavigator: true).pop('dialog');
    var body = jsonDecode(response.body);
    print(body);
    if (body["success"].toString() == "true") {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("logintype", type);
      await savetoken(body["data"]["access_token"],"","",body["data"]["email"],
          body["data"]["name"]);
      if( body["data"]["country_id"].toString() != "null"
      ){
        Navigator.of(contexta).pushReplacement(MaterialPageRoute(builder: (contexta) {
          return Mainpage();
        }));
      }else {
      }
    }
    else {
      alert(body["message"].toString());
    }
  }
  alertwait(){
    showDialog(barrierDismissible: false,context: contexta, builder: (context) {
      return AlertDialog(elevation: 0,backgroundColor: Colors.transparent,content: Container(width: 30,height:30,
          child: Center(child :SizedBox( width: 30,height: 30, child: CircularProgressIndicator()))),
      );});
  }
  final FirebaseMessaging fire = FirebaseMessaging.instance;
  Future login(phone ,password,GlobalKey<FormState> key)async{
    if(key.currentState.validate()) {
      fire.getToken().then((value)async {
        var data = {"password": password, "phone": phone, "token":value};
        //put here the url to add account
        var url = "https://filtery-eg.com/api/auth/loginTechnical";
        alertwait();
        var response = await http.post(Uri.parse(url), body: data);
        Navigator.of(contexta, rootNavigator: true).pop('dialog');
        var body = jsonDecode(response.body);
        print(body);
        if (body["message"] == "login Successfuly") {
          await savetoken(body["data"]["access_token"], phone, password,
              body["data"]["user"]["email"],
              body["data"]["user"]["name"]);
          navigate();
        }
        else {
          alert("الرجاء اعادة المحاولة والتأكد من كلمة السر و الرقم!");
        }
      });
    }
  }
  void savetoken(token,phone ,password,email,name)async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
    sharedPreferences.setString("phone",phone );
    sharedPreferences.setString("password",password );
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("name", name);
  }

}