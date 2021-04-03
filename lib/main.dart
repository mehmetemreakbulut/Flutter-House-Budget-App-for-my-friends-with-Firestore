import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goril/ufuk.dart';

import 'dennis.dart';
import 'emre.dart';
import 'mehmet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'House Budget',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("House Budget"),),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        InkWell(
          child: Container(
            height: 50,
            color: Colors.amber[700],
            child: const Center(child: Text('Emre')),
          ),
          onTap: (){
            Navigator.of(context)
                .push(
                MaterialPageRoute(builder: (context) => emre_pg())
            );
          },
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          child: Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Dennis')),
          ),
          onTap: (){
            Navigator.of(context)
                .push(
                MaterialPageRoute(builder: (context) => dennis_pg())
            );
          },
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          child:Container(
            height: 50,
            color: Colors.amber[300],
            child: const Center(child: Text('Ufuk')),
          ),
          onTap: (){
            Navigator.of(context)
                .push(
                MaterialPageRoute(builder: (context) => ufuk_pg())
            );
          },
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          child:Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Mehmet')),
          ),
          onTap: (){
            Navigator.of(context)
                .push(
                MaterialPageRoute(builder: (context) => mehmet_pg())
            );
          },
        ),
      ],
    );
  }
}


