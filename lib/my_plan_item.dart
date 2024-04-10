import 'package:flutter/material.dart';

class MyPlanItem extends StatelessWidget {
  final String title;
  final String time;
  final String details;

  const MyPlanItem(
      {super.key,
      required this.title,
      required this.time,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(children: [
          Row(
            children: [
             const Text(
                "Plan motive:",
                style: const TextStyle(fontSize: 20),
              ),
             const  SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              Expanded(child: SizedBox()),
               GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.delete,
                  ),
                ),
              )
            ],
          ),
         const SizedBox(
            height: 3,
          ),
          Row(
            children: [
             const Text(
                "Workout time:",
                style: const TextStyle(fontSize: 20),
              ),
            const  SizedBox(
                width: 5,
              ),
              Text(
                time,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  Text(
                "Work details: ",
                style: const TextStyle(fontSize: 20),
              ),
            const  SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Text(
                details,
                style: const TextStyle(fontSize: 20),
              )),
             
            ],
          )
        ]),
      ),
    );
  }
}
