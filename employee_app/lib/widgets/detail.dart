import 'dart:convert';

import 'package:employee_app/APIConstant.dart';
import 'package:employee_app/models/emoplyee.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  int id;

  DetailPage({required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Employee? _employee;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  void loadData() async
  {
    fetchEmployee().then((value) => {
      setState(() {
        _employee = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Employee App for Id ${widget.id}"),
      ),
      body: _employee == null ? Center(child: CircularProgressIndicator(),) : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Name: ${(_employee!.name)}", style: TextStyle(fontSize: 20),),
            Text("Email: ${_employee!.email}", style: TextStyle(fontSize: 20),),
            Text("Department: ${_employee!.department}", style: TextStyle(fontSize: 20),),
            Text("Address: ${_employee!.address}", style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }

  Future<Employee> fetchEmployee() async {
    final response = await http.get(Uri.parse("${APIConstant.URL}/${widget.id}"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Employee.fromJson(jsonDecode(response.body)["sheet1"]);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load employeee');
    }
  }
}