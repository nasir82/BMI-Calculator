import 'dart:ffi';

import 'package:bmi_cal/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> 
with SingleTickerProviderStateMixin
{
  @override
  void initState() {
    
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_)=> const HomeScreen()));
    });
  }
  @override
  void dispose() {
     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
     overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
       Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue,Colors.purple],
            end: Alignment.bottomLeft,
            begin: Alignment.topRight)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.edit,size: 150,color: Colors.white,),
          Text("Measer your BMI")
          
        ]),
        ),
    );
  }
}