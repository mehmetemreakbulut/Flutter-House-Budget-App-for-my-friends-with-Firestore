


import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class AddNoteDennis extends StatelessWidget {

  TextEditingController sampledata1 = new TextEditingController();
  TextEditingController sampledata2 = new TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('dennis');
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(


        appBar: AppBar(
          actions: [
            FlatButton(onPressed: (){
              ref.add({
                'sampledata1': sampledata1.text,
                'sampledata2': sampledata2.text,
              }).whenComplete(() => Navigator.pop(context));
              // Map<String,dynamic> data = {"field1":sampledata1.text,"field2":sampledata2.text};
              //FirebaseFirestore.instance.collection("test").add(data);
            }, child: Container(child: Text('Save'))),
          ],
        ),

        body: Container(

          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: sampledata1,
                  decoration: InputDecoration(hintText: 'Title'),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextField(
                    controller: sampledata2,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(hintText: 'Notes'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
