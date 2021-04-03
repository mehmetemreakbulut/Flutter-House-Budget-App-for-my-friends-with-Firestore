import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goril/addNote.dart';

import 'addNoteMehmet.dart';
import 'editNote.dart';
void main() {
  runApp(mehmet_pg());
}
class mehmet_pg extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'House Budget',
      home: mehmet_page(),
    );
  }
}
class mehmet_page extends StatelessWidget {
  final ref = FirebaseFirestore.instance.collection("mehmet");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("House Budget"),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add,color: Colors.white,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>AddNoteMehmet()));
        } ,),
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2 ),
                itemCount: snapshot.hasData ? snapshot.data.docs.length:0,
                itemBuilder: (_,index){
                  return GestureDetector(
                    onTap :(){Navigator.push(context, MaterialPageRoute(builder: (_)=>EditNote(docToEdit: snapshot.data.docs[index],)));
                    }
                    ,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      height: 150,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          Text(snapshot.data.docs[index]['sampledata1']),
                          Text(snapshot.data.docs[index]['sampledata2']),
                        ],
                      ),
                    ),
                  );
                });
          }
      ),
    );
  }
}