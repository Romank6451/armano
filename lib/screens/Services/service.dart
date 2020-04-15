

import 'package:armano/screens/Services/Sednoffer.dart';
import 'package:armano/screens/Services/widgets/Bottombar.dart';
import 'package:armano/screens/Services/widgets/Helperlist.dart';
import 'package:armano/screens/Services/widgets/provideservises.dart';
import 'package:armano/screens/Services/widgets/tools.dart';
import 'package:armano/utills/MyColors.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {

 TextEditingController title=TextEditingController();

  
  var firestore= Firestore.instance;
 Future getservices() async {
   
QuerySnapshot qn= await firestore.collection("config").getDocuments();
return qn.documents;

 }

update(){
  var k=[title.text];
  firestore.collection('config').document("app").updateData({
                        "helper":FieldValue.arrayUnion(k)
                      });
}

 @override
  void initState() {
    
    super.initState();
    title.addListener((){
      print(title.text);
    });
  }

  @override
  void dispose() {
    
    super.dispose();
    title.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
    body: DoubleBackToCloseApp(
      snackBar: SnackBar(content: Text('tap back again to leave')),
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: MyColors.background_white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              InkWell(
                onTap: (){
                  FirebaseAuth.instance.signOut();
                },
                child: Text("Services",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
                 InkWell(
                   onTap: (){
                     showDialog(
                      
                      context: context, builder: (BuildContext context){
                        return  Sendoffer();});
                    
                   },
                   child: Text("sendoffer",style: TextStyle(color:Colors.red,fontSize: 20,fontWeight: FontWeight.w700),)),
              
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  
                  decoration: BoxDecoration(
                    
                    border: Border.all(),
                  ),

                  //here write the services
                  child: Provideservices()

                ),
              ),
              

              Text("Tools",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  
                  decoration: BoxDecoration(
                    
                    border: Border.all(),
                  ),

                  //here write the services

                  child: ListView(
                    children: ListTile.divideTiles(
                      color: Colors.black,
                      
                      context: context,
                      tiles: [
                       Toolslist("Send push notification", Icon(Icons.arrow_forward_ios)),
                       Toolslist("Send push notification", Icon(Icons.arrow_forward_ios)),
                       Toolslist("Send push notification", Icon(Icons.arrow_forward_ios)),
                       Toolslist("Send push notification", Icon(Icons.arrow_forward_ios)),
                       Toolslist("Send push notification", Icon(Icons.arrow_forward_ios)),
                       Toolslist("Send push notification", Icon(Icons.arrow_forward_ios)),

                    ],).toList(),
                  ),
                  
                
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("Halpers",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                  SizedBox(width: 75,),
                  
                   Padding(
                     padding: const EdgeInsets.only(right:20.0),
                     child: InkWell(
                       
                       onTap: (){

                        showDialog(
                      
                      context: context, builder: (BuildContext context){
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                              height: 180,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10,),
                                    Text("Add User"),
                                    SizedBox(height: 10,),
                                    TextField(
                                      
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(8),
                                        border: OutlineInputBorder(),
                                        hintText: 'New User'
                                      ),
                                      controller: title,
                                     
                                      
                                      
                                      
                                    ),

                                    SizedBox(height: 10,),
                                    
                                    

                                    Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: FlatButton(onPressed: (){
                                         update();
                                          setState(() {
                                            
                                          });
                                          Navigator.of(context).pop();
                                        },shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        color: Colors.pink,
                                         child: Text('Add User',style: TextStyle(color: Colors.white),)),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });

                       },
                       
                       child: Text("New Add",style: TextStyle(fontSize: 15),)),
                   ),
                ],
              ),
             
              
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  
                  decoration: BoxDecoration(
                    
                    border: Border.all(),
                  ),

                  //here write the halpers
                  child: Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('config').snapshots(),
        builder: (_, snapshot){
        if(snapshot.connectionState== ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
         // List<dynamic> list=snapshot.data.documents[0].data['helper'];
          
          return ListView.builder(
            itemCount:snapshot.data.documents[0].data['helper'].length ,
            itemBuilder: (_,index){
             return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))
                ),
               child: ListTile(
                  title: Text(snapshot.data.documents[0].data['helper'][index]),
                  trailing: InkWell(
                    onTap: (){
                      
                      var k=[snapshot.data.documents[0].data['helper'][index]];
                      print(k);
                      firestore.collection('config').document("app").updateData({
                        "helper":FieldValue.arrayRemove(k)
                      });
                     // snapshot.data.documents[0].data['helper'][index]="";

                    },
                    child: Text('delete',style: TextStyle(color: Colors.red),)),
                ),
             );

          });
        }
      }),
    ),
                
                ),
              ),
             
             Bottombar()

            ],
          ),
          
        ),
      ),
    ),
    );
  }
}


