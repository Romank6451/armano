import 'package:armano/Services/Chatlist.dart';
import 'package:armano/Services/service.dart';
import 'package:flutter/material.dart';



class Bottombar extends StatefulWidget {
  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  @override
  Widget build(BuildContext context) {
    return  Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  image: DecorationImage(image: AssetImage('assets/images/splash_screen.png'),
                  fit: BoxFit.cover)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:40.0,right: 40,top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Services()));

                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.home,color: Colors.white,),
                            Text("Home",style: TextStyle(color: Colors.white,))
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatlist()));
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.message,color: Colors.white,),
                            Text("Messages",style: TextStyle(color: Colors.white,))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ),
            );
  }
}

