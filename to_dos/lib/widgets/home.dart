// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:to_dos/widgets/add.dart';
import 'package:to_dos/widgets/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _todos = [
    {
      "name": "Multiple page",
      "desc": "How to structure multiple page",
      "place": "Amphi"
    },
    {
      "name": "Navigation",
      "desc": "Simple , pass data forward, pass data backward",
      "place": "Amphi"
    },
    {
      "name": "ListView",
      "desc": "ListView, ListTile and Card",
      "place": "Amphi"
    },
    {
      "name": "Dinner",
      "desc": "Nasi Ayam Amyra rusli",
      "place": "Ee ji ban, Melaka Raya"
    },
    {
      "name": "Shared Preference",
      "desc": "Save and restore data",
      "place": "Amphi"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text(
            "Todo List App",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
                onPressed: () async {
                  // 1. Waiiit for this page to finish and receive the item passed
                  // 2. If you are using await, you need to add async to the nearliest func curly bracket
                  var passedItem = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPage()),
                  );
                  // 3. process the receive item
                  if (passedItem != null) {
                    _todos.add(passedItem);
                    setState(() {
                      _todos;
                    });
                  }
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _todos.length,
            // what to show in each row / index
            // for eadh row/index I will show a Container/div of height 50, of color amber,
            // Inside the container show a centered text showing the _todos at that position
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  color: Colors.orange,
                  child: ListTile(
                    title: Text(_todos[index]["name"]!),
                    subtitle: Text(_todos[index]["desc"]!.length > 40
                        ? _todos[index]["desc"]!.substring(0, 37) + "..."
                        : _todos[index]["desc"]!),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(item: _todos[index])));
                    },
                  ));
            }));
  }
}
