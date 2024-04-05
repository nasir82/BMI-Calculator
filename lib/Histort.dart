import 'package:bmi_cal/list_item.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(children: [

       Expanded(
         child: ListView.builder(
          itemCount: 10,
          
          itemBuilder: (context,index){
       
            return const MyListItem(current: "10", diff: "5");
          }),
       )
      ],)
     
    );
  }
}