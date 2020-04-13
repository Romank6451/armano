
import 'package:armano/Services/widgets/Bottombar.dart';
import 'package:armano/Services/widgets/Helperlist.dart';
import 'package:armano/Services/widgets/provideservises.dart';
import 'package:armano/Services/widgets/tools.dart';
import 'package:armano/utills/MyColors.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text("Services",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  
                  decoration: BoxDecoration(
                    
                    border: Border.all(),
                  ),

                  //here write the services
                  child: ListView(
                    shrinkWrap: true,
                    children: ListTile.divideTiles(
                      color: Colors.black,
                      
                      context: context,
                      tiles: [
                       Provideservices("Software development", Icon(Icons.arrow_forward_ios)),
                       Provideservices("Software development", Icon(Icons.arrow_forward_ios)),
                       Provideservices("Software development", Icon(Icons.arrow_forward_ios)),
                       Provideservices("Software development", Icon(Icons.arrow_forward_ios)),
                       Provideservices("Software development", Icon(Icons.arrow_forward_ios)),
                       Provideservices("Software development", Icon(Icons.arrow_forward_ios)),

                      
                    ],).toList(),
                  ),

                  
                
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

              Text("Halpers",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  
                  decoration: BoxDecoration(
                    
                    border: Border.all(),
                  ),

                  //here write the halpers
                  child: ListView(
                    children: ListTile.divideTiles(
                      color: Colors.black,
                      
                      context: context,
                      tiles: [
                      Halperlist("vovo@gmail.com", "delete"),
                      Halperlist("vovo@gmail.com", "delete"),
                      Halperlist("vovo@gmail.com", "delete"),
                      Halperlist("vovo@gmail.com", "delete"),
                      Halperlist("vovo@gmail.com", "delete"),


                    ],).toList(),
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


