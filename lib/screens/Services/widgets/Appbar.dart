import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  String name;
  Appbar(this.name);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration:BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/splash_screen.png'),fit: BoxFit.cover)
        ) ,
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Column(
              children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,color: Colors.white,)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(name,style: TextStyle(color: Colors.white,fontSize: 20),),
                          Padding(
                            padding: const EdgeInsets.only(left:100.0),
                            child: Text('online',style: TextStyle(color: Colors.red,fontSize: 12),),
                          ),
                        ],
                      ),
                      _popup()
                    ],
                  ),
                ),
                
              ],
            ),
      ),
    );
  }
  Widget _popup()=>PopupMenuButton<int>(
    icon: Icon(Icons.more_vert,color:Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    itemBuilder: (context)=>[
      PopupMenuItem(value: 1,
        child: Text("Send an offer")),
        PopupMenuItem(value: 2,
          child: Text("Block")),
          PopupMenuItem(value: 3,
        child: Text("Press release distribution")),
        
    ],
  );
}