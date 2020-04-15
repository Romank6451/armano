import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Sendoffer extends StatefulWidget {
  @override
  _SendofferState createState() => _SendofferState();
}

class _SendofferState extends State<Sendoffer> {
  var firestore= Firestore.instance;
var service;
var days;
List <String> data=<String>[
  '1 day','2 days','3 days','4 days','5 days'
];
  TextEditingController title=TextEditingController();
  void _drop(String sel){
    setState(() {
      this.service=sel;
    });
  }
  Future getservices() async {
   
QuerySnapshot qn= await firestore.collection("services").getDocuments();
return qn.documents;

 }
  @override
  Widget build(BuildContext context) {
    return Container(
child: 
   Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                              height: 350,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10,),
                                    Text("Select Service"),
                                    SizedBox(height: 10,),
                                    StreamBuilder<QuerySnapshot>(
                                      stream:firestore.collection('services').snapshots() ,
                                      builder: (_,snapshot){
                                        if(snapshot.connectionState==ConnectionState.waiting){
                                              return Container(
                                                child: CircularProgressIndicator(),
                                              );
                                            }else{
                                              return DropdownButton(
                                      value: service,
                                      onChanged: (valuesalectedbuuser){
                                        _drop(valuesalectedbuuser);
                                      },
                                      hint: Text('Select the service'),
                                      isExpanded: true,
                                      items: snapshot.data.documents.map((DocumentSnapshot doc){
                                        return DropdownMenuItem<String>(
                                          value: doc.data['title'],
                                          child: Text(doc.data['title']));
                                      }).toList(),
                                       );
                                            }
                                    }
                                    ),
                                    

                                    SizedBox(height: 10,),
                                    DropdownButton(
                                      hint: Text('Set The Duration'),
                                      isExpanded: false,
                                      value: days,
                                      onChanged: (valuesalectedbuuser){
                                        setState(() {
                                          days=valuesalectedbuuser;
                                        });
                                      },
                                      items: data.map(( value){
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value));
                                      }).toList(),
                                      
                                       
                                       ),

                                    SizedBox(height: 10,),
                                    Text("Price"),
                                    SizedBox(height: 10,),
                                    TextField(
                                      
                                      decoration: InputDecoration(
                                        
                                        prefixIcon: Icon(Icons.attach_money),
                                        contentPadding: EdgeInsets.all(8),
                                        border: OutlineInputBorder(),
                                        hintText: 'Price'
                                      ),
                                      
                                     
                                      
                                      
                                      
                                    ),

                                    SizedBox(height: 10,),
                                    
                                    

                                    Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: FlatButton(onPressed: (){
                                        
                                          Navigator.of(context).pop();
                                        },shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        color: Colors.pink,
                                         child: Text('Send Offer',style: TextStyle(color: Colors.white),)),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        )   
    
  
    );
  }
}