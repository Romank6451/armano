

import 'package:flutter/material.dart';



class Messagebar extends StatefulWidget {
  @override
  _MessagebarState createState() => _MessagebarState();
}

class _MessagebarState extends State<Messagebar> {
  @override
  Widget build(BuildContext context) {
    return  Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(right: 30),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  color: Colors.white
                ),
                child: Row(
                 
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 30,left: 20),
                      width: 270,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        autofocus: false,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type your message'
                        ),
                      ),
                    ),
                    Icon(Icons.send,color: Colors.black,)
                  ],
                ),
              ),
            );
  }
}

