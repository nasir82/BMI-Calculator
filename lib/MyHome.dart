import 'package:bmi_cal/Histort.dart';
import 'package:bmi_cal/Profile.dart';
import 'package:bmi_cal/home_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex = 0;
  List screenList = [
     HomeScreen(),
    const History(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("appbar"),
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