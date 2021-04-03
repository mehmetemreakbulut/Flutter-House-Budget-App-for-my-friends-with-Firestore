import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget{

    DocumentSnapshot docToEdit;

    EditNote({this.docToEdit});
  _editNoteState createState() => _editNoteState();
}

class _editNoteState extends State<EditNote>{
  TextEditingController sampledata1 = new TextEditingController();
  TextEditingController sampledata2 = new TextEditingController();

  void initState(){
    sampledata1 = TextEditingController(text: widget.docToEdit['sampledata1']);
    sampledata2 = TextEditingController(text: widget.docToEdit['sampledata2']);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          FlatButton(onPressed: (){
    widget.docToEdit.reference.update({
    'sampledata1': sampledata1.text,
    'sampledata2': sampledata2.text,
    }).whenComplete(() => Navigator.pop(context));


    //ref.add({
    //'sampledata1': sampledata1.text,
    //'sampledata2': sampledata2.text,
    // }).whenComplete(() => Navigator.pop(context));
    // Map<String,dynamic> data = {"field1":sampledata1.text,"field2":sampledata2.text};
    //FirebaseFirestore.instance.collection("test").add(data);
    },child: Container(child: Text('Save'))),
          FlatButton(onPressed: (){
            widget.docToEdit.reference.delete().whenComplete(() => Navigator.pop(context));


            //ref.add({
            //'sampledata1': sampledata1.text,
            //'sampledata2': sampledata2.text,
            // }).whenComplete(() => Navigator.pop(context));
            // Map<String,dynamic> data = {"field1":sampledata1.text,"field2":sampledata2.text};
            //FirebaseFirestore.instance.collection("test").add(data);
          },child: Container(child: Text('Delete'))),
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
    );
  }
}