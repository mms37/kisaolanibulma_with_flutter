import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('En Kısa İsmi Bulma'),
        ),
        body: Center(
          child: NameDisplayWidget(),
        ),
      ),
    );
  }
}

class NameDisplayWidget extends StatefulWidget {
  @override
  _NameDisplayWidgetState createState() => _NameDisplayWidgetState();
}

class _NameDisplayWidgetState extends State<NameDisplayWidget> {
  String name1 = '';
  String name2 = '';
  String name3 = '';

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('İsimleri Girin'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    name1 = value;
                  });
                },
                decoration: InputDecoration(labelText: 'İsim 1'),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    name2 = value;
                  });
                },
                decoration: InputDecoration(labelText: 'İsim 2'),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    name3 = value;
                  });
                },
                decoration: InputDecoration(labelText: 'İsim 3'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }

  String getShortestName() {
    List<String> names = [name1, name2, name3];
    String shortestName = names[0];

    for (String name in names) {
      if (name.length < shortestName.length) {
        shortestName = name;
      }
    }

    return shortestName;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'En Kısa İsim:',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 10),
        Text(
          getShortestName(),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _showDialog,
          child: Text('İsimleri Gir'),
        ),
      ],
    );
  }
}
