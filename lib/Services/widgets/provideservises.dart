import 'package:flutter/material.dart';

class Provideservices extends StatelessWidget {

Icon backicon;
String service;

Provideservices(this.service,this.backicon);
  @override
  Widget build(BuildContext context) {
    return ListTile(
                        trailing: backicon,
                        title: Text(service),
                      );
  }
}