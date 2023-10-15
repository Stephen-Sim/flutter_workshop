import 'dart:convert';

import 'package:employee_app/APIConstant.dart';
import 'package:employee_app/models/emoplyee.dart';
import 'package:employee_app/widgets/add.dart';
import 'package:employee_app/widgets/detail.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> _employees = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  void loadData() async
  {
    fetchEmployees().then((value) => {
      setState(() {
        _employees = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Employee App"),
      ),
      body: ListView.builder(
        itemCount: _employees.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_employees[index].name),
            subtitle: Text(_employees[index].department),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(id: _employees[index].id)));
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var passedItem = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));

          if (passedItem != null) {
            print(passedItem);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // keyword Future -> the keyword here means this is an async mehtod...
  Future<List<Employee>> fetchEmployees() async {
    final response = await http.get(Uri.parse(APIConstant.URL));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Employee.employeesFromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load employeee');
    }
  }
}
