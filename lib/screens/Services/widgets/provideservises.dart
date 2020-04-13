import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class Provideservices extends StatefulWidget {

  @override
  _ProvideservicesState createState() => _ProvideservicesState();
}

class _ProvideservicesState extends State<Provideservices> {


 TextEditingController title=TextEditingController();
 TextEditingController description=TextEditingController();
 TextEditingController servicelist=TextEditingController();

var firestore= Firestore.instance;

Future getservices() async {
   
QuerySnapshot qn= await firestore.collection("services").getDocuments();
return qn.documents;

 }
 chanengevalue(DocumentSnapshot post){
   title.text=post.data['title'];
    description.text=post.data['desc'];
    List<dynamic> list=post.data['services'];
    String serv=list.reduce((value,element)=>value+','+element);
    servicelist.text=serv;
    print("String: $serv");
    
 }
 String tt;

 void update(DocumentSnapshot post) async {
    
   List<dynamic> again=servicelist.text.split(",");
    print("list: $again");
    
    print("again: $again");
  await firestore.collection("services").document(post.documentID).updateData({'title':title.text,'desc':description.text,'services':again});
 }
 
 @override
  void initState() {
    
    super.initState();
   

    title.addListener((){
      print(title.text);
    });
    description.addListener((){
      print(description.text);
    });
    servicelist.addListener((){
      print(servicelist.text);
    });
  }
  @override
  void dispose() {
    
    super.dispose();
    title.dispose();
    description.dispose();
    servicelist.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('services').snapshots(),
        builder: (_, snapshot){
        if(snapshot.connectionState== ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (_,index){
              return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))
                ),
                child: ListTile(
                  title: Text(snapshot.data.documents[index].data['title']),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: (){
                    chanengevalue(snapshot.data.documents[index]);
                    
                    showDialog(
                      
                      context: context, builder: (BuildContext context){
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                              height: MediaQuery.of(context).size.height-200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10,),
                                    Text("Title"),
                                    SizedBox(height: 10,),
                                    TextField(
                                      
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(8),
                                        border: OutlineInputBorder(),
                                        hintText: 'title'
                                      ),
                                      controller: title,
                                     
                                      
                                      
                                      
                                    ),

                                    SizedBox(height: 10,),
                                    Text("Description"),
                                    SizedBox(height: 10,),
                                    Container(
                                      
                                      height: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10,top: 10),
                                        child: TextField(
                                          
                                          maxLines: 20,
                                          
                                          decoration: InputDecoration.collapsed(
                                            
                                            
                                            
                                            hintText: 'description'
                                          ),
                                          controller:description,
                                          
                                          
                                        ),
                                      ),
                                    ),

                                      
                                    SizedBox(height: 10,),
                                    Text("Services"),
                                    SizedBox(height: 10,),
                                    Container(
                                      
                                      height: 150,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10,top: 10),
                                        child: TextField(
                                          
                                          maxLines: 10,
                                          
                                          decoration: InputDecoration.collapsed(
                                            
                                            
                                            
                                            hintText: 'description'
                                          ),
                                          controller:servicelist,
                                          
                                          
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 20,),

                                    Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: FlatButton(onPressed: (){
                                          update(snapshot.data.documents[index]);
                                          setState(() {
                                            getservices();
                                          });
                                          Navigator.of(context).pop();
                                        },shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        color: Colors.pink,
                                         child: Text('Update',style: TextStyle(color: Colors.white),)),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                  },
                ),
              );
          });
        }
      }),
    );
  }
}
