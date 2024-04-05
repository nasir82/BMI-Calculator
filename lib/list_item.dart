import 'package:flutter/material.dart';

class MyListItem extends StatelessWidget {

  final String current;
  final String diff;

  const MyListItem({super.key,required this.current,required this.diff});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(),
    
        borderRadius: BorderRadius.circular(10),
        color:  Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
      
              Row(
                
                children: [
                  Text("Curren BMI :"),
      
                  Text(current,style: const TextStyle(
                    fontSize: 24
                  ),),
                ],
              ),
              Row(
                children: [
                  Text("Dif BMI :"),
      
                  Text(diff,style: const TextStyle(
                    fontSize: 24
                  ),),
                ],
              ), 
      
        ]),
      ),

    );
  }
}
