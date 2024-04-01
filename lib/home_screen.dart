import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Measure your BMI",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 172, 161, 126),
        elevation: 10,
        centerTitle: true,
        toolbarOpacity: 1,
      ),
      backgroundColor: Color.fromARGB(255, 128, 185, 161),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        "Age",
                        textAlign: TextAlign
                            .start, // Optionally set the text alignment
                      ),
                    ),
                    Text("  ft"),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text("  ench"),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("  dal"),
                    Text("  de"),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
