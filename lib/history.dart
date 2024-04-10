import 'package:bmi_cal/Database/db_helper.dart';
import 'package:bmi_cal/Database/model.dart';
import 'package:bmi_cal/list_item.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});
  

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History>  {

   bool isNull = false;
   List<ListModel>? lstOf;
  @override
  void initState() {
    super.initState();
    DatabaseHelper.instance.queryDatabase().then((value) {
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
      body: isNull ?
     const Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
     
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("No data available")]),
           SizedBox(height: 10,),
        ],
      )

      : Column(children: [

       Expanded(
         child: ListView.builder(
          itemCount: lstOf?.length ?? 0,
          
          itemBuilder: (context,index){
       
            return  MyListItem(current: lstOf![index].name!, diff: lstOf![index].diff!,date: lstOf![index].time!,);
          }),
       ),

       GestureDetector(
        onTap: (){


        },
        
         child: Container(
          padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 64, 137, 66),
            border: Border.all(
              color: Colors.black26,
              
              width: 2,
              style: BorderStyle.solid
            ),
            borderRadius: BorderRadius.circular(12)
          ),
         
          child:const Padding(
          
            padding:  EdgeInsets.all(8.0),
            child: Text("See Progress",style: TextStyle(
              fontSize: 20,
             
            ),),
          )
          ),
       ),
      ],)
     
    );
  }
}