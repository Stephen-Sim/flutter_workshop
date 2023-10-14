// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var _todoNameTextEditingController = TextEditingController();
  var _todoDescTextEditingController = TextEditingController();
  var _todoPlaceTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text(
          "Todo List App - Add Todo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Enter Todo Name"),
              controller: _todoNameTextEditingController,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Enter Todo Description"),
              controller: _todoDescTextEditingController,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Enter the Place"),
              controller: _todoPlaceTextEditingController,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 55,
              width: 300,
              child: TextButton(
                onPressed: () {
                  // go back to previous page

                  if (_todoNameTextEditingController.text.isEmpty ||
                      _todoDescTextEditingController.text.isEmpty ||
                      _todoPlaceTextEditingController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "All fields are required!!!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    return;
                  }

                  // In sender, pass the item as second argument of navigator.pop
                  var newItem = {
                    "name": _todoNameTextEditingController.text,
                    "desc": _todoDescTextEditingController.text,
                    "place": _todoPlaceTextEditingController.text
                  };

                  Navigator.pop(context, newItem);
                },
                child: Text(
                  "Save My Todo",
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
