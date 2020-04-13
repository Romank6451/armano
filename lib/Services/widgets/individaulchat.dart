import 'package:flutter/material.dart';

class Individual extends StatelessWidget {

  String inputimage;
  String name,location,date,last_msg;
  Individual(this.inputimage,this.name,this.last_msg,this.location,this.date,);
  @override
  Widget build(BuildContext context) {
    return  ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(200)),
                             image: DecorationImage(image: AssetImage(inputimage),fit: BoxFit.fill)
                            ),
                            
                          ),
                          
                          title:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                
                                children: <Widget>[
                                   Text(name,style: TextStyle(fontWeight: FontWeight.w600)),
                                   Padding(padding: EdgeInsets.only(left: 50)),

                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text(location,style: TextStyle(fontSize: 8,)),
                                   )
                                ],
                              ),
                              Text(last_msg,style: TextStyle(fontSize: 12))
                            ],
                          ),
                          subtitle: Text(date,style: TextStyle(fontSize: 8,color:Colors.grey,)),
                          trailing: Icon(Icons.arrow_forward_ios),
                        );
  }
}