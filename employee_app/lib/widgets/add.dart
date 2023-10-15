import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var nameEditingController = TextEditingController();
  var emailEditingController = TextEditingController();
  var departmentEditingController = TextEditingController();
  var addressEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Employee App - Add"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Enter employee name"),
              controller: nameEditingController,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(hintText: "Enter employee email"),
              controller: emailEditingController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              decoration:
                  InputDecoration(hintText: "Enter employee department"),
              controller: departmentEditingController,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(hintText: "Enter employee address"),
              controller: addressEditingController,
            ),
            SizedBox(height: 20),
            SizedBox(
                height: 50,
                width: 340,
                child: ElevatedButton(
                    onPressed: () {
                      var newItem = {
                        "name": nameEditingController.text,
                        "email": emailEditingController.text,
                        "department": departmentEditingController.text,
                        "address": addressEditingController.text,
                      };

                      Navigator.pop(context, newItem);
                    },
                    child: Text("Add New Employee")))
          ],
        ),
      ),
    );
  }
}
