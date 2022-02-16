import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flattery2/logic/cache_helper.dart';
import 'package:flattery2/logic/homelogic.dart';
import 'package:flattery2/logic/loginlogic.dart';
import 'package:flattery2/screens/detaildone.dart';
import 'package:flattery2/screens/loginscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Detail.dart';
class Mainpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Secondstate();
  }
}
class Secondstate extends State<Mainpage> with SingleTickerProviderStateMixin{
  Loginlogic loginlogic;
  GlobalKey<FormState> key = new GlobalKey<FormState>();
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  var Value = false;
  var download = true;
  var download2 = false;
  List notifications =[];
  TabController tabController;
  Homelogic homelogic;
  List data =[];
  List data2 =[];
  @override
  void initState() {
    homelogic = new Homelogic(context);
    getdata();
    tabController = new TabController(vsync: this, length:4);
    super.initState();
  }
  getdata()async{
    homelogic.initializesnotification();
    var datas = await homelogic.getdata();
    data = datas["orders"];
    data2 = datas["oldOrders"];
    download = false;
    if(mounted) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr,
      child: Scaffold(body:Form(key: key,
        child:TabBarView(physics: NeverScrollableScrollPhysics() ,controller: tabController,
          children:[ Container(child: Column(children: [
            Container(
              child: Container(padding: EdgeInsets.only(right: MediaQuery
                  .of(context)
                  .size
                  .height * 0.01, left: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02),
                  margin: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.12,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width
                  ,
                  child: Row(children: [
                    Expanded(child: Container(margin: EdgeInsets.only(top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.03),
                      height: MediaQuery
                          .of(context)
                          .size
                          .width * 0.4,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.5,
                      child: Image(image: AssetImage("comp/logo.png"),),)),
                    Expanded(flex: 6,
                        child: Container(margin: EdgeInsets.only(top: MediaQuery
                            .of(context)
                            .size
                            .height * 0.03, left: MediaQuery
                            .of(context)
                            .size
                            .width * 0.2, right: MediaQuery
                            .of(context)
                            .size
                            .width * 0.2,),
                            child:  AutoSizeText("الصفحة الرئيسية",maxLines: 1, style: TextStyle(
                                color: Colors.blue,fontSize: 20),))),
                    Expanded(child: Container(margin: EdgeInsets.only(top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.03),
                      child: IconButton(icon: IconButton(icon: Icon(Icons.menu,
                        color: Colors.blue, size: 30,), onPressed: () {
                        tabController.animateTo(1);
                      }),),))
                  ],)),
            ),Container(
                child: download == true ? Container(
                  child: Container(margin: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.25),
                      child: Center(child: SizedBox(width: 30,
                          height: 30,
                          child: CircularProgressIndicator()))),) : Container(
                    child: data.length == 0 ? Container(width: MediaQuery
                        .of(context)
                        .size
                        .width, margin: EdgeInsets.only(top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.4), child: Center(
                      child: Directionality(textDirection: TextDirection.rtl, child:
                      Text("لا توجد طلبات",
                        style: TextStyle(color: Colors.black54, fontSize: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02),)),
                    ),) : Container(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.8,
                      child: ListView.builder(
                          itemCount: data.length, itemBuilder: (context, i) {
                        return Container(margin: EdgeInsets.only(top: MediaQuery
                            .of(context)
                            .size
                            .height * 0),
                          child: Column(children: [
                            Container(
                                child: Container(child: Container(width: MediaQuery
                                    .of(
                                    context)
                                    .size
                                    .width,
                                    margin: EdgeInsets.only(right: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.01, left: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.01),
                                    child:
                                    Container(child: Container(width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                      margin: EdgeInsets.only(right: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.05, top: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.00, left: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.05),
                                      child: Directionality(
                                          textDirection: TextDirection.rtl, child:
                                      Container(
                                        margin: EdgeInsets.only(left: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.02),
                                        child: Row(children:
                                        [
                                          Expanded(
                                              child: Directionality(
                                                  textDirection: TextDirection
                                                      .rtl,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width * 0.04),
                                                    child:  AutoSizeText(
                                                        "اسم العميل :",maxLines: 1,
                                                        style: TextStyle(
                                                            fontSize: 15,fontWeight: FontWeight.bold)),
                                                  ))),
                                          Expanded(flex: 2,
                                              child: Directionality( textDirection: TextDirection.rtl,child: Container(alignment: Alignment.centerRight,margin: EdgeInsets.only(right: 10)
                                                ,child: Text(data[i]["name"],style: TextStyle(color: Colors.blue,fontSize: 13),),))),
                                          //Expanded(child: Directionality(textDirection: TextDirection.rtl,child: Text("تاريخ الانتهاء",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.015)))),
                                          //Expanded(child: Text(""//contract[i]["contract_end"]
                                          //  ,style: TextStyle(color: Colors.blueAccent,fontSize: MediaQuery.of(context).size.height*0.015)))
                                        ]),
                                      )),))))),
                            Container(margin: EdgeInsets.only(right: MediaQuery
                                .of(context)
                                .size
                                .width * 0.06), width: MediaQuery
                                .of(context)
                                .size
                                .width, alignment: Alignment.centerRight, child:
                            Row(children: [
                              Expanded(flex: 2,child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Directionality(textDirection: TextDirection.rtl,
                                    child: Text(data[i]["DeviceType"].toString(), style: TextStyle(
                                        color: Colors.blueAccent, fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.015),),
                                  )))
                              ,
                              Expanded(child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Directionality(textDirection: TextDirection.rtl,
                                    child: AutoSizeText("نوع الجهاز :",maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold)),
                                  ))),
                            ]),
                            ),
                            Container(margin: EdgeInsets.only(right: MediaQuery
                                .of(context)
                                .size
                                .width * 0.06), width: MediaQuery
                                .of(context)
                                .size
                                .width, alignment: Alignment.centerRight, child:
                            Row(children: [
                              Expanded(flex: 2,child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Directionality(textDirection: TextDirection.rtl,
                                    child: Text(data[i]["phone"].toString()=="null"?"لا يوجد":data[i]["phone"].toString(), style: TextStyle(
                                        color: Colors.blueAccent, fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.015),),
                                  )))
                              ,
                              Expanded(child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Directionality(textDirection: TextDirection.rtl,
                                    child: AutoSizeText("رقم هاتف :",maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold)),
                                  ))),
                            ]),
                            ),
                            Container(
                              child:  InkWell(onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                  return Detail(data: data[i],);
                                }));
                              },
                                child: Container(padding: EdgeInsets.only(left: 10,right: 10) ,color: Colors.blue,
                                  child: Text("التفاصيل" ,style: TextStyle(
                                      fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold) ),),
                              ),)
                            ,
                            Container(child: Divider(),)
                          ],),
                        );
                      }
                      ),
                    )))
          ],),),Container(color: Colors.white,
    child: Stack(children: [Container(),
    Positioned(top: MediaQuery
        .of(context)
        .size
        .height * 0.1,
    width: MediaQuery
        .of(context)
        .size
        .width,
    child: Container(decoration: BoxDecoration(color: Colors.black12,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(40))), height: MediaQuery
        .of(context)
        .size
        .height * 0.9,
    child: ListView(children: [
    Container(width: MediaQuery
        .of(context)
        .size
        .width * 0.4,
    height: MediaQuery
        .of(context)
        .size
        .width * 0.4,
    child: Image(image: AssetImage("comp/logo.png"),),),
    Directionality(textDirection: TextDirection.rtl,
    child: InkWell(onTap: () {
      tabController.animateTo(0);
    },
    child: Container(
    margin: EdgeInsets.only(top: MediaQuery
        .of(context)
        .size
        .height * 0.05, left: MediaQuery
        .of(context)
        .size
        .width * 0.1, right: MediaQuery
        .of(context)
        .size
        .width * 0.1), child: ListTile(title: Text(
    "الصفحة الرئيسية", style: TextStyle(
    color: Colors.blue, fontSize: MediaQuery
        .of(context)
        .size
        .height * 0.02),), leading: Container(
    width: MediaQuery
        .of(context)
        .size
        .height * 0.035,
    height: MediaQuery
        .of(context)
        .size
        .height * 0.035,
    child: Image(fit: BoxFit.fill,
    image: AssetImage("comp/home.png"))),))))
    ,
    Container(margin: EdgeInsets.only(left: MediaQuery
          .of(context)
          .size
          .width * 0.1, right: MediaQuery
          .of(context)
          .size
          .width * 0.1),
        child: Divider(color: Colors.blue, thickness: 1,),),
   Directionality(textDirection: TextDirection.rtl,
    child: Container(
    margin: EdgeInsets.only(left: MediaQuery
        .of(context)
        .size
        .width * 0.1, right: MediaQuery
        .of(context)
        .size
        .width * 0.1), child: InkWell(onTap: () {
          tabController.animateTo(2);
    }, child: ListTile(title: Text("طلبات الصيانة",
    style: TextStyle(
    color: Colors.blue, fontSize: MediaQuery
        .of(context)
        .size
        .height * 0.02),), leading: Container(
    width: MediaQuery
        .of(context)
        .size
        .height * 0.035,
    height: MediaQuery
        .of(context)
        .size
        .height * 0.035,
    child: Image(fit: BoxFit.fill,
    image: AssetImage("comp/us.png"))))))),
    Container(margin: EdgeInsets.only(left: MediaQuery
        .of(context)
        .size
        .width * 0.1, right: MediaQuery
        .of(context)
        .size
        .width * 0.1),
    child: Divider(color: Colors.blue, thickness: 1,),),
      Directionality(textDirection: TextDirection.rtl,
          child: Container(
              margin: EdgeInsets.only(left: MediaQuery
                  .of(context)
                  .size
                  .width * 0.1, right: MediaQuery
                  .of(context)
                  .size
                  .width * 0.1), child: InkWell(onTap: ()async {
                    tabController.animateTo(3);
                    var dats = await homelogic.getnotifiy();
                    notifications = dats["notifiy"];
                    print(dats);
                    setState(() {});
          }, child: ListTile(title: Text("اشعارات",
            style: TextStyle(
                color: Colors.blue, fontSize: MediaQuery
                .of(context)
                .size
                .height * 0.02),), leading: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .height * 0.035,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.035,
              child: Icon(Icons.notifications_none,color: Colors.blue,size: 30,)))))),
      Container(margin: EdgeInsets.only(left: MediaQuery
          .of(context)
          .size
          .width * 0.1, right: MediaQuery
          .of(context)
          .size
          .width * 0.1),
        child: Divider(color: Colors.blue, thickness: 1,),),
    Directionality(textDirection: TextDirection.rtl,
    child: InkWell(onTap:(){
         homelogic.logout();
     },
    child: Container(
    margin: EdgeInsets.only(bottom: MediaQuery
        .of(context)
        .size
        .height * 0.2, left: MediaQuery
        .of(context)
        .size
        .width * 0.1, right: MediaQuery
        .of(context)
        .size
        .width * 0.1), child: ListTile(title: Text(
    "تسجيل الخروج", style: TextStyle(
    color: Colors.blue, fontSize: MediaQuery
        .of(context)
        .size
        .height * 0.02),), leading: Container(
    width: MediaQuery
        .of(context)
        .size
        .height * 0.035,
    height: MediaQuery
        .of(context)
        .size
        .height * 0.035,
    child: Image(fit: BoxFit.fill,
    image: AssetImage("comp/exit.png"))),))))
    ],)))

    ],),
    ) ,talbat(),notification(),
        ])
      ) ,),
    );}
  Widget notification(){
    return Container(child: Column(children: [
      Container(
        child: Container(padding: EdgeInsets.only(right: MediaQuery
            .of(context)
            .size
            .height * 0.01, left: MediaQuery
            .of(context)
            .size
            .height * 0.02),
            margin: EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height * 0.02),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.12,
            width: MediaQuery
                .of(context)
                .size
                .width
            ,
            child: Row(children: [
              Expanded(child: Container(margin: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.03),
                height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.4,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
                child: Image(image: AssetImage("comp/logo.png"),),)),
              Expanded(flex: 6,
                  child: Container(margin: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03, left: MediaQuery
                      .of(context)
                      .size
                      .width * 0.25, right: MediaQuery
                      .of(context)
                      .size
                      .width * 0.2,),
                      child:  AutoSizeText("الاشعارات",maxLines: 1, style: TextStyle(
                          color: Colors.blue,fontSize: 20),))),
              Expanded(child: Container(margin: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.03),
                child: IconButton(icon: IconButton(icon: Icon(Icons.menu,
                  color: Colors.blue, size: 30,), onPressed: () {
                  tabController.animateTo(1);
                }),),))
            ],)),
      ),Container(
          child: download2 == true ? Container(
            child: Container(margin: EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height * 0.25),
                child: Center(child: SizedBox(width: 30,
                    height: 30,
                    child: CircularProgressIndicator()))),) : Container(
              child: notifications.length==0? Container(width: MediaQuery
                  .of(context)
                  .size
                  .width, margin: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4), child: Center(
                child: Directionality(textDirection: TextDirection.rtl, child:
                Text("لا توجد اشعارات",
                  style: TextStyle(color: Colors.black54, fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02),)),
              ),) :Container(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.8,margin: EdgeInsets.only(top: 25),
                child: ListView.builder(
                    itemCount: notifications.length, itemBuilder: (context, i) {
                  return Container(margin: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * 0),
                    child: Column(children: [
                      Container(
                          child: Container(child: Container(width: MediaQuery
                              .of(
                              context)
                              .size
                              .width,
                              margin: EdgeInsets.only(right: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.01, left: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.01),
                              child:
                              Container(child: Container(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                                margin: EdgeInsets.only(right: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.05, top: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.00, left: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.05),
                                child: Directionality(
                                    textDirection: TextDirection.rtl, child:
                                Container(
                                  margin: EdgeInsets.only(left: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.02),
                                  child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Directionality(textDirection: TextDirection.rtl,
                                        child: Text(notifications[i]["msg"], style: TextStyle(
                                            color: Colors.blueAccent, fontSize: 14),),
                                      )),
                                )),))))),
                      Container(margin: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Directionality(textDirection: TextDirection.rtl,
                            child: Text(notifications[i]["created_at"].toString().substring(0,10), style: TextStyle(
                                color: Colors.black, fontSize: 12),),
                          )),
                      Container(child: Divider(),)
                    ],),
                  );
                }
                ),
              ) ))
    ],),);
  }
  Widget talbat(){
    return Container(child: Column(children: [
      Container(
        child: Container(padding: EdgeInsets.only(right: MediaQuery
            .of(context)
            .size
            .height * 0.01, left: MediaQuery
            .of(context)
            .size
            .height * 0.02),
            margin: EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height * 0.02),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.12,
            width: MediaQuery
                .of(context)
                .size
                .width
            ,
            child: Row(children: [
              Expanded(child: Container(margin: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.03),
                height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.4,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
                child: Image(image: AssetImage("comp/logo.png"),),)),
              Expanded(flex: 6,
                  child: Container(margin: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03, left: MediaQuery
                      .of(context)
                      .size
                      .width * 0.2, right: MediaQuery
                      .of(context)
                      .size
                      .width * 0.2,),
                      child:  AutoSizeText("طلبات الصيانة",maxLines: 1, style: TextStyle(
                          color: Colors.blue,fontSize: 20),))),
              Expanded(child: Container(margin: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.03),
                child: IconButton(icon: IconButton(icon: Icon(Icons.menu,
                  color: Colors.blue, size: 30,), onPressed: () {
                  tabController.animateTo(1);
                }),),))
            ],)),
      ),Container(
          child: download2 == true ? Container(
            child: Container(margin: EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height * 0.25),
                child: Center(child: SizedBox(width: 30,
                    height: 30,
                    child: CircularProgressIndicator()))),) : Container(
              child: data.length == 0 ? Container(width: MediaQuery
                  .of(context)
                  .size
                  .width, margin: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.7), child: Center(
                child: Directionality(textDirection: TextDirection.rtl, child:
                Text("لا توجد طلبات",
                  style: TextStyle(color: Colors.black54, fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02),)),
              ),) : Container(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.8,
                child: ListView.builder(
                    itemCount: data2.length, itemBuilder: (context, i) {
                  return Container(margin: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * 0),
                    child: Column(children: [
                      Container(
                          child: Container(child: Container(width: MediaQuery
                              .of(
                              context)
                              .size
                              .width,
                              margin: EdgeInsets.only(right: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.01, left: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.01),
                              child:
                              Container(child: Container(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                                margin: EdgeInsets.only(right: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.05, top: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.00, left: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.05),
                                child: Directionality(
                                    textDirection: TextDirection.rtl, child:
                                Container(
                                  margin: EdgeInsets.only(left: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.02),
                                  child: Row(children:
                                  [
                                    Expanded(
                                        child: Directionality(
                                            textDirection: TextDirection
                                                .rtl,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.04),
                                              child:  AutoSizeText(
                                                  "اسم العميل :",maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 15,fontWeight: FontWeight.bold)),
                                            ))),
                                    Expanded(flex: 2,
                                        child: Directionality( textDirection: TextDirection.rtl,child: Container(alignment: Alignment.centerRight,margin: EdgeInsets.only(right: 10)
                                          ,child: Text(data2[i]["name"],style: TextStyle(color: Colors.blue,fontSize: 13),),))),
                                    //Expanded(child: Directionality(textDirection: TextDirection.rtl,child: Text("تاريخ الانتهاء",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.015)))),
                                    //Expanded(child: Text(""//contract[i]["contract_end"]
                                    //  ,style: TextStyle(color: Colors.blueAccent,fontSize: MediaQuery.of(context).size.height*0.015)))
                                  ]),
                                )),))))),
                      Container(margin: EdgeInsets.only(right: MediaQuery
                          .of(context)
                          .size
                          .width * 0.06), width: MediaQuery
                          .of(context)
                          .size
                          .width, alignment: Alignment.centerRight, child:
                      Row(children: [
                        Expanded(flex: 2,child: Container(
                            alignment: Alignment.centerRight,
                            child: Directionality(textDirection: TextDirection.rtl,
                              child: Text(data2[i]["DeviceType"], style: TextStyle(
                                  color: Colors.blueAccent, fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.015),),
                            )))
                        ,
                        Expanded(child: Container(
                            alignment: Alignment.centerRight,
                            child: Directionality(textDirection: TextDirection.rtl,
                              child: AutoSizeText("نوع الجهاز :",maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,fontWeight: FontWeight.bold)),
                            ))),
                      ]),
                      ),
                      Container(margin: EdgeInsets.only(right: MediaQuery
                          .of(context)
                          .size
                          .width * 0.06), width: MediaQuery
                          .of(context)
                          .size
                          .width, alignment: Alignment.centerRight, child:
                      Row(children: [
                        Expanded(flex: 2,child: Container(
                            alignment: Alignment.centerRight,
                            child: Directionality(textDirection: TextDirection.rtl,
                              child: Text(data2[i]["phone"].toString()=="null"?"لا يوجد":data2[i]["phone"].toString(), style: TextStyle(
                                  color: Colors.blueAccent, fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.015),),
                            )))
                        ,
                        Expanded(child: Container(
                            alignment: Alignment.centerRight,
                            child: Directionality(textDirection: TextDirection.rtl,
                              child: AutoSizeText("رقم هاتف :",maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,fontWeight: FontWeight.bold)),
                            ))),
                      ]),
                      ),
                      Container(
                        child:  InkWell(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return Detaildone(data: data2[i],);
                          }));
                        },
                          child: Container(padding: EdgeInsets.only(left: 10,right: 10) ,color: Colors.blue,
                            child: Text("التفاصيل" ,style: TextStyle(
                                fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold) ),),
                        ),)
                      ,
                      Container(child: Divider(),)
                    ],),
                  );
                }
                ),
              )))
    ],),);
  }
}