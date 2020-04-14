import 'package:armano/screens/Services/widgets/Bottombar.dart';
import 'package:armano/screens/Services/widgets/individaulchat.dart';
import 'package:armano/utills/MyColors.dart';
import 'package:flutter/material.dart';

class Chatlist extends StatefulWidget {
  @override
  _ChatlistState createState() => _ChatlistState();
}

class _ChatlistState extends State<Chatlist> {
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
                          child: Individual(),
                        
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