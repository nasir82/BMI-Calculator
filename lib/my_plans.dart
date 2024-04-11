import 'package:bmi_cal/Database/db_plans.dart';
import 'package:bmi_cal/Database/plan_model.dart';
import 'package:bmi_cal/my_plan_item.dart';
import 'package:flutter/material.dart';

class MyPlans extends StatefulWidget {
  const MyPlans({super.key});
  

  @override
  State<MyPlans> createState() => _PlanState();
}

class _PlanState extends State<MyPlans>  {

   bool isNull = false;
   List<PlanListModel>? lstOf;
  @override
  void initState() {
    super.initState();
    PlansDatabase.instance.queryDatabase().then((value) {
      setState(() {
        lstOf = value;

        int? len = lstOf?.length;
        
        if(len==null || len == 0){
          print("object");
          isNull = true;
        }
      });
    });
  }
   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Your plans"),
        centerTitle: true,
      ),
      body: isNull ?
     const Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
     
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("No plan available")]),
           SizedBox(height: 10,),
        ],
      )

      : Column(children: [

       Expanded(
         child: ListView.builder(
          itemCount: lstOf?.length ?? 0,
          
          itemBuilder: (context,index){
       
            return  MyPlanItem(title: lstOf![index].title!, time: lstOf![index].time!,details: lstOf![index].details!,);
          }),
       ),
      ],)
     
    );
  }
}