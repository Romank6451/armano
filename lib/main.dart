import 'package:armano/screens/Services/service.dart';
import 'package:armano/screens/login/login.dart';
import 'package:armano/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: _homewidgetdisplay(),
    );
  }

  
}

Widget _homewidgetdisplay(){
  return StreamBuilder(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return SplashScreen();
      }else{
        if(snapshot.hasData){
          return Services();
        }else{
          return Login();
        }
      }

  });
}
