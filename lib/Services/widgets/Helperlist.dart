import 'package:flutter/material.dart';


class Halperlist extends StatelessWidget {
    String email,option;

  Halperlist(this.email,this.option);
  @override
  Widget build(BuildContext context) {
    return ListTile(
                        trailing: Text(option,style: TextStyle(color: Colors.red),),
                        title: Text(email),
                      );
  }
}