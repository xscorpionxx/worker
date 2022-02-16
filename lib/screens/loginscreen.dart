import 'dart:convert';
import 'package:flattery2/logic/loginlogic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'mainpage.dart';
class Loginpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Secondstate();
  }
}
class Secondstate extends State<Loginpage>{
  Loginlogic loginlogic;
  GlobalKey<FormState> key = new GlobalKey<FormState>();
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  var Value = false;
  @override
  void initState() {
    loginlogic = new Loginlogic(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr,
      child: Scaffold(body:Form(key: key,
        child: ListView(children: [
          Center(child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),width: MediaQuery.of(context).size.width * 0.35,height: MediaQuery.of(context).size.height*0.25,
          child: Image(image: AssetImage("comp/logo.png"),),),)
          ,Container(padding: EdgeInsets.only(right: 10),margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05
              ,right:MediaQuery.of(context).size.width * 0.08,left: MediaQuery.of(context).size.width * 0.08 ),
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white)
            ,child: Center(
              child: Directionality(textDirection: TextDirection.rtl,child:
              TextFormField(controller: phone,validator: loginlogic.validatphone,style: TextStyle(fontSize: MediaQuery.of(context).size.height* 0.018),keyboardType: TextInputType.phone,decoration: InputDecoration(hintText: "رقم الهاتف",prefixIcon:Icon(Icons.phone,color: Colors.blue,) ,border: InputBorder.none),)),
            ),),Container(padding: EdgeInsets.only(right: 10),margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05
              ,right:MediaQuery.of(context).size.width * 0.08,left: MediaQuery.of(context).size.width * 0.08 ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white)
            ,child: Center(
              child: Directionality(textDirection: TextDirection.rtl,child:
              TextFormField(controller: password,validator: loginlogic.validatpassword,style: TextStyle(fontSize: MediaQuery.of(context).size.height* 0.018),obscureText: true,decoration: InputDecoration(hintText: "كلمة السر",prefixIcon:Icon(Icons.lock,color: Colors.blue,) ,border: InputBorder.none),)),
            ),),
          Container(margin: EdgeInsets.only( top: MediaQuery.of(context).size.width*0.05,left:MediaQuery.of(context).size.width*0.1 ,right : MediaQuery.of(context).size.width*0.08),alignment: Alignment.centerRight,child: Directionality(textDirection: TextDirection.rtl
              ,child: CheckboxListTile(value: Value,title: Text("نسيت كلمة السر",style: TextStyle(fontSize:MediaQuery.of(context).size.height* 0.015,color: Colors.black38),), onChanged: (bool value) {setState(() {Value = value;});  },)),),
            Container(child:InkWell( onTap: (){
    loginlogic.login(phone.text, password.text, key);
    },child: Container(margin: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.06 ,left: MediaQuery.of(context).size.width * 0.25,right:MediaQuery.of(context).size.width * 0.25 ),height: MediaQuery.of(context).size.height * 0.07,decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(10)),child:Center(child: Text("دخول",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height* 0.02))) ))),
         ],),
      ) ,),
    );

  }
}