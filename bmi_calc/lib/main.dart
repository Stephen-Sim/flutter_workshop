// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightSliderValue = 130;
  double _wetightSliderValue = 40;
  double _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "BMI Calculator",
                style: TextStyle(color: Colors.red, fontSize: 38),
              ),
              Image.network(
                "https://i.pinimg.com/474x/7e/8e/25/7e8e250809ddf2fff9ebc988fdab101d.jpg",
                height: 250,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We care about our health",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Height ${_heightSliderValue.toStringAsFixed(2)}cm",
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                value: _heightSliderValue,
                max: 200,
                min: 130,
                label: _heightSliderValue.round().toString(),
                onChanged: (double value) {
                  // setState func is used to refresh the UI
                  setState(() {
                    _heightSliderValue = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Weight: ${_wetightSliderValue.toStringAsFixed(2)}kg" + (_wetightSliderValue > 100 ? " 😲😲😲" : ""),
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                value: _wetightSliderValue,
                max: 120,
                min: 40,
                label: _wetightSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _wetightSliderValue = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextButton.icon(
                onPressed: () {
                  _bmi = _wetightSliderValue / pow(_heightSliderValue / 100, 2);
                  String msg = "Your BMI: ${_bmi.toStringAsFixed(1)}. ";

                  if (_bmi < 18.5) {
                    msg += "Your are underweight";
                  } else if (_bmi > 25) {
                    msg += "Your are overweight";
                  } else {
                    msg += "Your are normal";
                  }

                  Fluttertoast.showToast(
                      msg: msg,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                icon: Icon(Icons.favorite),
                label: Text("Caculate BMI"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.red),
                    foregroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
