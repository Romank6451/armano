import 'package:armano/main.dart';
import 'package:armano/screens/Services/Chatscreen.dart';
import 'package:armano/screens/Services/widgets/Bottombar.dart';
import 'package:armano/utills/MyColors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../chat_screen.dart';

class Chatlist extends StatefulWidget {
  @override
  _ChatlistState createState() => _ChatlistState();
}

class _ChatlistState extends State<Chatlist> {

  Future<DocumentSnapshot> getuser(id) async {
   return await Firestore.instance.collection("users").document(id).get();

  }
bool _visiable=false;
  checkopacity(data){
    if(data=='0'){
      return false;
    }else{
      return true;
    }
  }

  Gettime(timestamp){

  return DateFormat("hh:mm a").format(timestamp.toDate());
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
                            
                            // border: Border.all(),
                          ),

                          //here write the halpers
                          child: StreamBuilder(
                            stream: Firestore.instance.collection("conversations")
                                .orderBy('time', descending: true)
                                .snapshots(),

                            builder: (cc,snaps){
                              List<DocumentSnapshot> conversations=snaps.data.documents;

                              return ListView.builder(

                                itemCount: conversations.length,
                                itemBuilder: (c,i){
                                 return FutureBuilder(
                                   future: getuser(conversations[i]["from"]),
                                   builder:(ii,user){
                                     if(!user.hasData){
                                       return Text('Loading');
                                     }else{
                                     return Container(
                                       decoration: BoxDecoration(
                                     border: Border(bottom: BorderSide(color: Colors.black.withAlpha(20)))
                                         ),
                                       child: ListTile(
                        onTap: (){
                          
                          print('chat clicked'+conversations.toString());

                          Navigator.push(context, MaterialPageRoute(builder: (contex)=>ChatScreen(conversations[i])));

                          Firestore.instance.collection("conversations").document(conversations[i].documentID).updateData({
                            "unreadmsg":0
                          });
                        },
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              
                              shape: BoxShape.circle,
                             image: DecorationImage(image: NetworkImage(user.data["photo"]),fit: BoxFit.fill)
                            ),
                            
                          ),
                          
                          title:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                   Text(user.data["name"],style: TextStyle(fontWeight: FontWeight.w600)),
                                   Padding(padding: EdgeInsets.only(left: 50)),

                                   Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(Gettime(conversations[i]["time"]),style: TextStyle(fontSize: 10,)),
                                   )
                                ],
                              ),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Opacity(
                                    opacity: 0.8,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width/2,
                                        child: Text(conversations[i]["last_content"],overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 12)))),
                                  
                                  Opacity(
                                    opacity: checkopacity(conversations[i]["unreadmsg"].toString())?1:0.0,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle
                                      ),
                                      child: Center(child: Text(conversations[i]["unreadmsg"].toString(),style: TextStyle(fontSize: 11,color: Colors.white))),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                         
                          // trailing: Icon(Icons.arrow_forward_ios),
                        ),
                                     );}
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