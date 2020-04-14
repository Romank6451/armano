import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class Halperlist extends StatefulWidget {
  @override
  _HalperlistState createState() => _HalperlistState();
}

class _HalperlistState extends State<Halperlist> {


  var firestore= Firestore.instance;
 Future getservices() async {
   
QuerySnapshot qn= await firestore.collection("config").getDocuments();
return qn.documents;

 }

 @override
  void initState() {
    
    super.initState();

  }
  @override
  void dispose() {    
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('config').snapshots(),
        builder: (_, snapshot){
        if(snapshot.connectionState== ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
         // List<dynamic> list=snapshot.data.documents[0].data['helper'];
          
          return ListView.builder(
            itemCount:snapshot.data.documents[0].data.length ,
            itemBuilder: (_,index){
             return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))
                ),
               child: ListTile(
                  title: Text(snapshot.data.documents[0].data['helper'][index]),
                  trailing: InkWell(
                    onTap: (){
                      print('object');
                      firestore.collection('config').document("app").updateData({
                        "helper":FieldValue.arrayRemove(snapshot.data.documents[0].data['helper'][index])


                      });
                     // snapshot.data.documents[0].data['helper'][index]="";

                    },
                    child: Text('delete',style: TextStyle(color: Colors.red),)),
                ),
             );

          });
        }
      }),
    );
}}