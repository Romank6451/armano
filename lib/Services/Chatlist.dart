import 'package:armano/Services/widgets/Bottombar.dart';
import 'package:armano/Services/widgets/individaulchat.dart';
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height/50,),
              Text("Chats",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),

            
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    
                    decoration: BoxDecoration(
                      
                      border: Border.all(),
                    ),

                    //here write the halpers
                    child: ListView(
                      children: ListTile.divideTiles(
                        color: Colors.black,
                        
                        context: context,
                        tiles: [
                        
                       Individual('assets/images/splash_screen.png','Umer waqas','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/logo.png','Waqas','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/loging_card_bottom.png','Amandi','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/logo.png','Hanif','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/splash_screen.png','Bannu','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/splash_screen.png','Roman','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/splash_screen.png','Roman','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/splash_screen.png','Roman','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/splash_screen.png','Roman','my name is khan','pakistan','20:20:2020'),

                       Individual('assets/images/splash_screen.png','Roman','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/splash_screen.png','Roman','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/splash_screen.png','Roman','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/splash_screen.png','Roman','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/splash_screen.png','Roman','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/splash_screen.png','Roman','my name is khan','pakistan','20:20:2020'),
                       Individual('assets/images/splash_screen.png','Roman','my name is khan','pakistan','20:20:2020'),

                       

                       

                        
                      ],).toList(),
                    ),
                  
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