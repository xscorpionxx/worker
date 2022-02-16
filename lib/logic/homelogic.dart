
//import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flattery2/screens/loginscreen.dart';
import 'package:flattery2/screens/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class Homelogic {
  var contexta;
  Homelogic(BuildContext context){
    contexta = context;
  }
  //final FirebaseMessaging fire = FirebaseMessaging.instance;
  //Translation translation;
  //TranslationModel _translated = TranslationModel(translatedText:'', detectedSourceLanguage: 'en');
  String validatepassword(String value) {
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
  void alert(able,message){
    if(able) {
      showDialog(context: contexta, builder: (context) {
        return AlertDialog(
            content: Directionality(
                textDirection: TextDirection.rtl, child: Text(message)),
            actions: [
              new ElevatedButton(onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Mainpage()));
                }, child: Text("نعم")),
            ]);
      });
    }
    else{
      showDialog(context: contexta, builder: (context) {
        return AlertDialog(
            content: Directionality(
                textDirection: TextDirection.rtl, child: Text(message)),
            actions: [
              new ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text("نعم")),
            ]);
      });
    }
  }

  alertwait(){
    showDialog(barrierDismissible: false,context: contexta, builder: (context) {
      return AlertDialog(elevation: 0,backgroundColor: Colors.transparent,content: Container(width: 30,height:30,
          child: Center(child :SizedBox( width: 30,height: 30, child: CircularProgressIndicator()))),
      );});
  }
  getdata() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
  //  alertwait();
    var url = "https://filtery-eg.com/api/auth/technical/home";
    var response=await http.get(Uri.parse(url),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var body = jsonDecode(response.body);
   // Navigator.of(contexta,rootNavigator: true).pop("dialog");
   return body["data"] ;
  }
  getnotifiy() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    alertwait();
    var url = "https://filtery-eg.com/api/auth/technical/notifiy";
    var response=await http.get(Uri.parse(url),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var body = jsonDecode(response.body);
    Navigator.of(contexta).pop("dialog");
    return body["data"] ;
  }
  done(id,note) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    alertwait();
    var url = "https://filtery-eg.com/api/auth/technical/orderDone";
    var response=await http.post(Uri.parse(url),headers: {
      'Authorization': 'Bearer $token',
    },body: {"order_id":id.toString(),"note":note.toString()});
    var body = jsonDecode(response.body);
    Navigator.of(contexta,rootNavigator: true).pop("dialog");
    if(body["success"] ==true){
      alert(true,body["message"]);
    }
    else{
      alert(false,body["message"].toString());
    }
  }
  FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
  void initializesnotification() async{
    var inita = AndroidInitializationSettings('@mipmap/logofl');
    var init = InitializationSettings(android: inita);
    notificationsPlugin.initialize(init);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        show(message.notification.title, message.notification.body);
      }
    });
  }
  Future<void> show(title ,body)async{
    notificationsPlugin.show(0, title, body,
        await NotificationDetails(
            android:  AndroidNotificationDetails(
                'channel id',
                'channel name',
                'channel description',
                importance: Importance.max
            ),
            iOS: IOSNotificationDetails()
        ));
  }
  final FirebaseMessaging fire = FirebaseMessaging.instance;
  logout()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var url = "https://filtery-eg.com/api/auth/technical/logout";
    var response=await http.get(Uri.parse(url),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var body = jsonDecode(response.body);
    if(body["success"] ==true){
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.clear();
      Navigator.of(contexta).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(contexta, MaterialPageRoute(builder: (BuildContext context) => Loginpage()));

    }
  }

}