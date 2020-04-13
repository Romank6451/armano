

import 'package:armano/screens/Services/widgets/Appbar.dart';
import 'package:armano/screens/Services/widgets/Messagebar.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
    String name;
  Chatscreen(this.name);

  @override
  _ChatscreenState createState() => _ChatscreenState(name);
}

class _ChatscreenState extends State<Chatscreen> {
   String name;
  _ChatscreenState(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/splash_screen.png'),fit: BoxFit.cover)
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Appbar(name),
                    
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          
                          decoration: BoxDecoration(
                            
                            border: Border.all(),
                          ),

                          //here write the halpers
                          
                        ),
                      ),
                      

                    
                ],
              ),
            ),
            Align(
                    alignment: Alignment.bottomCenter,
                    child: Messagebar())
          ],
        ),
      ),
      
    );
  }
}