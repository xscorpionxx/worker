import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Detaildone extends StatefulWidget{
  var data;
  Detaildone({this.data});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateDetaildone(data:data);
  }
}
class StateDetaildone extends State<Detaildone>{
  TextEditingController note;
  var data ;
  StateDetaildone({this.data});
  //Contactlogic contactlogic;
  var able = false;
  @override
  void initState() {
    print(data);
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
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text(data["phone"].toString()=="null"?"لا يوجد":data["phone"].toString(),style: TextStyle(fontSize:15,color: Colors.black),)),) ,),Expanded(child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text("رقم الهاتف:",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),)),))],) ,
      ),Container(margin: EdgeInsets.only(top: 15),
        child:Row(children: [Expanded(child:Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text(data["DeviceType"],style: TextStyle(fontSize:15,color: Colors.black),)),) ,),Expanded(child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text("نوع الجهاز :",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),)),))],) ,
      ), Container(margin: EdgeInsets.only(top: 15),
        child:Row(children: [Expanded(child:Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text(data['desc'],style: TextStyle(fontSize:15,color: Colors.black),)),) ,),Expanded(child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text("الصياننة المطلوية :",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),)),))],) ,
      ), Container(margin: EdgeInsets.only(top: 15),
        child:Row(children: [Expanded(child:Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text(data["address"],style: TextStyle(fontSize:15,color: Colors.black),)),) ,),Expanded(child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text("العنوان :",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),)),))],) ,
      ),
      Container(margin: EdgeInsets.only(top: 15),
        child:Row(children: [Expanded(child:Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: AutoSizeText(data["Note"],maxLines: 3,style: TextStyle(fontSize:15,color: Colors.black),)),) ,),Expanded(child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07
            ,right:MediaQuery.of(context).size.width*0.07), child: Directionality(textDirection: TextDirection.rtl,child: Text("ملاحظة حول الصيانة :",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),)),))],) ,
      ),
    ],),),);
  }
}