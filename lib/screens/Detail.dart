import 'package:flattery2/logic/homelogic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Detail extends StatefulWidget{
  var data;
  Detail({this.data});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateDetail(data: data);
  }
}
class StateDetail extends State<Detail>{
  var data ;
  TextEditingController note;
  StateDetail({this.data});
  //Contactlogic contactlogic;
  var able = false;
  Homelogic homelogic ;
  @override
  void initState() {
    print(data);
    homelogic = new Homelogic(context);
    note = new TextEditingController();
    //contactlogic = new Contactlogic(context);
    // TODO: implement initState
    super.initState();
  }
  String validate(String value) {
    if(value.isEmpty){
      return 'لا يمكن أن ترسل الملاحظة فارغة';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Container(color: Colors.white60,child:data==null? Center(child: CircularProgressIndicator(),): ListView(children: [
      Container(height: MediaQuery.of(context).size.height*0.07,color: Colors.blue,child: Row(children: [
        Expanded(child: InkWell(onTap: (){
          Navigator.of(context).pop();},
          child: Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.025),child: Icon( Icons.arrow_back_ios,size:MediaQuery.of(context).size.height * 0.04 ,color: Colors.white,)
          ),
          )),
          Expanded(child: Container(margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.03) ,alignment: Alignment.centerRight
          ,child: Text("التفاصيل",style:TextStyle(fontSize: MediaQuery.of(context).size.height*0.02,color: Colors.white),),))],),),
      Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.12,left: MediaQuery.of(context).size.width*0.07
          ,right:MediaQuery.of(context).size.width*0.07), child: SingleChildScrollView(child: Directionality(textDirection: TextDirection.rtl,child: Text("",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025),))),),
      Container(
        child:Row(children: [Expanded(child:Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text(data["name"],style: TextStyle(fontSize:15,color: Colors.black),)),) ,),Expanded(child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text("اسم العميل :",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),)),))],) ,
      ),Container(margin: EdgeInsets.only(top: 15),
        child:Row(children: [Expanded(child:Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text(data["phone"].toString()=="null"?"لا يوجد رقم هاتف":data["phone"].toString(),style: TextStyle(fontSize:15,color: Colors.black),)),) ,),Expanded(child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text("رقم الهاتف:",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),)),))],) ,
      )
        ,Container(margin: EdgeInsets.only(top: 15),
        child:Row(children: [Expanded(child:Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text(data["DeviceType"].toString(),style: TextStyle(fontSize:15,color: Colors.black),)),) ,),Expanded(child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text("نوع الجهاز :",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),)),))],) ,
      ), Container(margin: EdgeInsets.only(top: 15),
        child:Row(children: [Expanded(child:Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text(data["desc"],style: TextStyle(fontSize:15,color: Colors.black),)),) ,),Expanded(child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text("الصيانة المطلوبة :",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),)),))],) ,
      ), Container(margin: EdgeInsets.only(top: 15),
        child:Row(children: [Expanded(child:Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text(data["address"],style: TextStyle(fontSize:15,color: Colors.black),)),) ,),Expanded(child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text("العنوان :",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),)),))],) ,
      ),
      Container(
        child:true?Container(): Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1,top: 45
        ) ,child:InkWell(onTap: (){
          setState(() {
            able =true;
          });
        }, child: Container(color: Colors.blue,child: Center(child: Text("اضافة ملاحظة",style: TextStyle(color: Colors.white),)),)),),
      ),
      Container(child: able?Directionality(
        textDirection: TextDirection.rtl,child: Container(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.01),margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05,right: MediaQuery.of(context).size.width*0.05,left:MediaQuery.of(context).size.width*0.05 ),decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black))
          ,child: TextFormField(controller: note,validator: validate,style: TextStyle(fontSize: MediaQuery.of(context).size.height* 0.015),decoration: InputDecoration(hintText: "ادخل ملاحظتك",border: InputBorder.none),),),
      ):Container(),),
      Container(
        child:true?Container(): Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1,top: 45
        ) ,child:InkWell(onTap: (){
          setState(() {
            able =false;
          });
        }, child: Container(color: Colors.blue,child: Center(child: Text("ارسال الملاحظة",style: TextStyle(color: Colors.white),)),)),),
      ),Container(
        child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,right: MediaQuery.of(context).size.width*0.2,top: 45
        ) ,child:InkWell(onTap: (){
          if(able){
            setState(() {
              homelogic.done(data["id"], note.text);
            });
          }
          else{
            setState(() {
            able = true;
            });
          }
        }, child: Container(color: Colors.blue,child: Center(child: Text("اتمام الطلب",style: TextStyle(color: Colors.white),)),)),),
      ),
      Container(
        child:able? Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,right: MediaQuery.of(context).size.width*0.2,top: 15
        ) ,child:InkWell(onTap: (){
            setState(() {
            able = false;
            });
        }, child: Container(color: Colors.blue,child: Center(child: Text("رجوع",style: TextStyle(color: Colors.white),)),)),):Container(),
      ),
       ],),),);
  }
}