import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class Halperlist extends StatefulWidget {
  @override
  _HalperlistState createState() => _HalperlistState();
}

class _HalperlistState extends State<Halperlist> {

  
 TextEditingController title=TextEditingController();
 


  var firestore= Firestore.instance;
 Future getservices() async {
   
QuerySnapshot qn= await firestore.collection("config").getDocuments();
return qn.documents;

 }
 chanengevalue(DocumentSnapshot post){
   title.text=post.data['helper'];
    

    
 }


 void update(DocumentSnapshot post) async {
    List<dynamic> list=post.data['helper'];
    
    print("String: $list");
   
 }

 void delete(DocumentSnapshot post)async{
   List<dynamic> list=post.data['helper'];
 
    
    print("String: $list");
 }


 
 @override
  void initState() {
    
    super.initState();

    title.addListener((){
      print(title.text);
    });
  
  }
  @override
  void dispose() {
    
    super.dispose();
    title.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getservices(),
        builder: (_, snapshot){
        if(snapshot.connectionState== ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
          List<dynamic> list=snapshot.data[0].data['helper'];
          
          return ListView.builder(
            itemCount:list.length ,
            itemBuilder: (_,index){
             return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))
                ),
               child: ListTile(
                  title: Text(list[index]),
                  trailing: Text('delete',style: TextStyle(color: Colors.red),),
                ),
             );

          });
        }
      }),
    );
}}