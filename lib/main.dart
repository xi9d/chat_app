import 'package:flutter/material.dart';

void main() {
  runApp(JournalApp());
}
class JournalApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Journal App',
      home: JournalHomePage(),
    );
  }
}
class JournalHomePage extends StatefulWidget{
  @override
  _JournalHomePageState createState() =>
      _JournalHomePageState();
}
class _JournalHomePageState  extends State<JournalHomePage>{
  Widget _image(){
    return Container(
      child: Image.asset("asset/fox.png"),

    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

        body: _image()
    );
  }

  void addEntry(String entry){
    if(entry.isNotEmpty){
      setState(() {
        entries.add(entry);
        editingController.clear();
      });
    }
  }
}