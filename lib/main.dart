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
  final List<String> entries = [];
  final TextEditingController editingController = TextEditingController();
  final List<String> _measures =[
    'meters',
    'kilometers',
    'grams',
    'Kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',

  ];
  late String _startMeasure = "Kilometers";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal  App'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,

      ),
      body: Column(
        children: <Widget>[

          DropdownButton(
              items: _measures.map((String value){
                return DropdownMenuItem<String>(
                    value: _startMeasure,
                    child: Text(value));
              }).toList(),
              onChanged: (value){
                setState(() {
                  _startMeasure = value!;
                });
              }),

          Expanded(
              child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(entries[index]),
                  visualDensity: VisualDensity.compact,
                  tileColor: Colors.orange,




                );
              },
              ),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
               controller: editingController,
                decoration: InputDecoration(
                  labelText: 'Add a new Entry'
                ),
                onSubmitted: (String entry){
                 addEntry(entry);
                },
          ),
          )
        ],

      ),
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