import 'package:flutter/material.dart';

class MyplanList extends StatelessWidget {
 const MyplanList({super.key});

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
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(children: [
         const Row(
            children: [
              Text(
                "Motive :",
                maxLines: 3,
                style:  TextStyle(fontSize: 20),
              ),
               SizedBox(
                width: 10,
              ),
              Text(
                "your motives bal",
                maxLines: 3,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
         const SizedBox(
            height: 3,
          ),
        const  Row(
            children: [
              Text(
                "Work time: ",
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "work time",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
            const  Text(
                "Details ",
                style: const TextStyle(fontSize: 20),
              ),
            const  SizedBox(
                width: 5,
              ),
           const   Expanded(
                  child: Text(
                "date,",
                style: const TextStyle(fontSize: 20),
              )),
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
          )
        ]),
      ),
    );
  }
}
