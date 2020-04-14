
import 'package:armano/screens/Services/Chatscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Individual extends StatelessWidget {
  var firestore=Firestore.instance;

 Future<void> getid()async{
   Future<FirebaseUser> user=FirebaseAuth.instance.currentUser();
 }
 
  
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      stream: firestore.collection('conversations').document().collection('message').snapshots(),
      builder: (_,snapshot){
          if(!snapshot.hasData){
            return Text('loading...');
          }
            else{
              print(snapshot.data.documents.length);
            return Container(
              child: Text('data'),
            );}
          
      });
  }

  
}