import 'package:bmi_cal/Database/collections.dart';
import 'package:bmi_cal/history.dart';
import 'package:bmi_cal/profile.dart';
import 'package:bmi_cal/home_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DataCollection dt = DataCollection();
  int myIndex = 0;
  List screenList = [
     HomeScreen(),
    const History(),
    const Profile()
  ];
  List titles = ["Measure Your BMI","Your Previous Measurements","My Profile"];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(titles[myIndex]),
        centerTitle: true,
      ),
      body: screenList[myIndex],

      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: myIndex,
        backgroundColor:  Color.fromARGB(255, 206, 209, 210),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.history),label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        onTap: (value) => {
            setState((){
              myIndex = value;
            })
          
        },),
    );
  }
}