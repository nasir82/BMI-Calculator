import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final ageCon = TextEditingController();
    final fett = TextEditingController();
    final inch = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("appbar"),
      ),
      body: SafeArea(
        child: Column(
         
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration
                      (
                        labelText: "Enter age",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                 Expanded(
                  child:  Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: TextField(
                      controller: fett,
                      cursorWidth: 20,
                        decoration: InputDecoration
                        (
                          labelText: "Height ft",
                           border: OutlineInputBorder(),
                        ),
                      ),
                   ),
                 ),
                   Expanded(
                   child:  Padding(
                     padding:  EdgeInsets.all(20.0),
                     child: TextField(
                      controller: inch,
                      cursorWidth: 20,
                        decoration: const InputDecoration
                        (
                          labelText: "Height inc",
                           border: OutlineInputBorder(),
                        ),
                      ),
                   ),
                 ),
              ],
            ),
            Container(
              width: double.infinity,
              child: Padding(
               
                padding: const EdgeInsets.only(right: 20,left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
                    OutlinedButton(onPressed: () => {}, child: Padding(
                      padding: const EdgeInsets.only(right: 20,left: 20),
                      child: Text("submit"),
                    ))
                  ],
                ),
              ),
            ),

           const Row(
              children:  [
                Text("Your BMI ...")
              ],
            ),

            SizedBox(height: 5,),
            Divider(thickness: 0.5,),

            SizedBox(height: 5,),
            Icon(Icons.health_and_safety,size: 200,color: Colors.cyan,),

            SizedBox(height: 5,),
            Divider(thickness: 0.5,),

            SizedBox(height: 5,),
            Container(
              height: 150,
              child: const Column(children: [
                SizedBox(height: 5,),
                Text("Text one "),
                SizedBox(height: 5,),
                Text("Text two "),
                SizedBox(height: 5,),
                Text("Text Three "),
                SizedBox(height: 5,),
                
               
              ],)
            )

        ]),
      ),
    );
  }
}
