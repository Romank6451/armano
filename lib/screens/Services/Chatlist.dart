import 'package:armano/main.dart';
import 'package:armano/screens/Services/widgets/Bottombar.dart';
import 'package:armano/screens/Services/widgets/individaulchat.dart';
import 'package:armano/utills/MyColors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chatlist extends StatefulWidget {
  @override
  _ChatlistState createState() => _ChatlistState();
}

class _ChatlistState extends State<Chatlist> {

  Future<DocumentSnapshot> getuser(id) async {
   return await Firestore.instance.collection("users").document(id).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: MyColors.background_white,

        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height/60,),
                  
                    Text("Chats",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                    SizedBox(height: 20,),

                  
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          
                          decoration: BoxDecoration(
                            
                            border: Border.all(),
                          ),

                          //here write the halpers
                          child: StreamBuilder(
                            stream: Firestore.instance.collection("conversations").snapshots(),
                            builder: (cc,snaps){
                              List<DocumentSnapshot> conversations=snaps.data.documents;
                              return ListView.builder(
                                itemCount: conversations.length,
                                itemBuilder: (c,i){
                                 return FutureBuilder(
                                   future: getuser(conversations[i]["from"]),
                                   builder:(ii,user){
                                     return Text(user.data["name"]);
                                   },
                                 );
                                },
                              );
                            },
                          )
                        
                        ),
                      ),
                      

                    
                ],
              ),
            ),
            Align(
                    alignment: Alignment.bottomCenter,
                    child: Bottombar())
          ],
        ),
    ),
      ),
    );
  }
}