import 'package:flutter/material.dart';

class MyListItem extends StatelessWidget {
  final String current;
  final String diff;
  final String date;

  const MyListItem(
      {super.key,
      required this.current,
      required this.diff,
      required this.date});

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
          Row(
            children: [
             const Text(
                "Current BMI:",
                style: const TextStyle(fontSize: 20),
              ),
             const  SizedBox(
                width: 10,
              ),
              Text(
                current,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
         const SizedBox(
            height: 3,
          ),
          Row(
            children: [
             const Text(
                "Diff with prev:",
                style: const TextStyle(fontSize: 20),
              ),
            const  SizedBox(
                width: 5,
              ),
              Text(
                diff,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
            const  Text(
                "Measure Date: ",
                style: const TextStyle(fontSize: 20),
              ),
            const  SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Text(
                date,
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
