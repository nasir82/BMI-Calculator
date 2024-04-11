import 'package:bmi_cal/utils_methods.dart';
import 'package:flutter/material.dart';

class PlanCreate extends StatefulWidget {
  const PlanCreate({super.key});

  @override
  State<PlanCreate> createState() => _PlanCreateState();
}

class _PlanCreateState extends State<PlanCreate> {

  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make a plan for you"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration:const InputDecoration(
                      labelText: "Enter motive",
                       border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: timeController,
                    decoration: const InputDecoration(
                      labelText: "Enter time",
                       border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
             const SizedBox(height: 15,),
            Container(
            
              child:  Flexible(
                child: Column(
                
                  children: [
                    Flexible(
                      child: TextField(
                        controller: detailsController,
                        maxLines: 150,
                        decoration:const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter details",
                        
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                 ElevatedButton(onPressed: () {
                 
                 if(titleController.text.isEmpty || timeController.text.isEmpty || detailsController.text.isEmpty){
                  print("fill upp the infos");
                 }else{
                   insertPlan(titleController.text, timeController.text, detailsController.text);

                 }
            
              }, child:const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                child: Text("Add"),
              )
              ),
          ])
          ],
        ),
      ),
    );
  }
}
