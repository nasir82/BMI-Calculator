
import 'package:bmi_cal/my_home.dart';
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

    Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_)=>  Home()));
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey,Colors.lightGreen],
            end: Alignment.bottomLeft,
            begin: Alignment.topRight)
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.health_and_safety,size: 150,color: Colors.white,),
          Text("BMI Indicates Your Physical Fitness")
          
        ]),
        ),
    );
  }
}