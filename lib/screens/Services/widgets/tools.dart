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
                      );
  }
}