import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // 1) In receiver, create a variable to store the received item
  Map<String,String> item;

  // 2) Create constructor to receive the item
  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text(
          "Todo List App - Detail",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${item["name"]}", style: TextStyle(fontSize: 20),),
            Text("Detail: ${item["desc"]}", style: TextStyle(fontSize: 20),),
            Text("Place: ${item["place"]}", style: TextStyle(fontSize: 20),)
          ],
        ),
      ),);
  }
}