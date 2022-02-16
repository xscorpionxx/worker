
import 'package:firebase_core/firebase_core.dart';
import 'package:flattery2/screens/loginscreen.dart';
import 'package:flattery2/screens/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'logic/mainlogic.dart';
//SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  Mainlogic mainlogic = new Mainlogic();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    //  MaterialApp(theme: ThemeData(fontFamily: 'Cairo'),title: "Faltery",debugShowCheckedModeBanner: false,
     //     home:Mainpage());
    FutureBuilder(future: mainlogic.getdata() , builder: (context ,snapshot ){
      if(snapshot.hasError){
        return MaterialApp(title: "error",debugShowCheckedModeBanner: false,
          home: Scaffold(body: Center(child: Text("Pls check internet connection"),),),);
      }
      if(snapshot.connectionState ==ConnectionState.done){
          if (mainlogic.data["token"] != null&&mainlogic.data["phone"] != null) {
                    return MaterialApp(
                        theme: ThemeData(fontFamily: 'Cairo'),
                        title: "Flatery",
                        debugShowCheckedModeBanner: false,
                        home: Mainpage() //Section1(username: data,)
                    );
          }
          else {
            return MaterialApp(theme: ThemeData(fontFamily: 'Cairo'),
                title: "Flatery",
                debugShowCheckedModeBanner: false,
                home: Loginpage()
            );
          }
        }
      return MaterialApp(title:"Loading",debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: CircularProgressIndicator()),),);
    },);
  }
}