import 'package:armano/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Toolslist extends StatelessWidget {

  String tools;
  Icon backicon;

  Toolslist(this.tools,this.backicon);
  @override
  Widget build(BuildContext context) {
    return ListTile(
                        trailing: backicon,
                        title: Text(tools),
      onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.push(context, MaterialPageRoute(builder: (contex)=>Login()));
                          Navigator.pop(context);

      },
                      );
  }
}