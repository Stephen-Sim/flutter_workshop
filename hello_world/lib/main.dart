import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // for each textfield, create the textEditingController
  var nameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
          title: const Text("This is my first Flutter App"),
          backgroundColor: Colors.red),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Text(
            "Welcome to my first flutter app!!",
            style: TextStyle(fontSize: 32, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              "https://i.pinimg.com/474x/52/bf/17/52bf1701d96156d5222c03592b65c06a.jpg",
              height: 300,
            ),
          ),
          SizedBox(
            height: 8,
            width: 10,
          ),
          Text("I hope you like it",
              style:
                  GoogleFonts.maShanZheng(textStyle: TextStyle(fontSize: 30))),
          const SizedBox(
            height: 8,
          ),
          const Text("Please enjoy my app", style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("This is left."), Text("This is right.")],
          ),
          TextField(
            decoration: InputDecoration(hintText: "Enter your name"),
            controller: nameEditingController,
          ),
          TextButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "HI, ${nameEditingController.text}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
            ),
            child: Text("Print My Name"),
          )
        ],
      )),
    );
  }
}
