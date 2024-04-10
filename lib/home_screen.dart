import 'package:bmi_cal/utils_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String txt = "Submit1";

  double? bmi;
  String bmiText = "";
  bool isChange = false;
  bool isSave = false;
  final textController = TextEditingController();
  final ageCon = TextEditingController();
  final fett = TextEditingController();
  final inch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: const InputDecoration(
                        labelText: "Enter weight",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: fett,
                      cursorWidth: 20,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: const InputDecoration(
                        labelText: "Height ft",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: inch,
                      cursorWidth: 20,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: const InputDecoration(
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
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: isSave
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              //here we need to call insertMethod,

                              insertIntoDatabase(bmiText);

                              setState(() {
                                isSave = !isSave;
                              });
                            },
                            child: Text("Save"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          OutlinedButton(
                              onPressed: () {
                                // here need to clear the controllers
                                textController.clear();
                                fett.clear();
                                inch.clear();
                                // we also update the bmi text
                                bmiText = " ";
                                setState(() {
                                  isChange = !isChange;
                                  isSave = !isSave;
                                });
                              },
                              child: Text("Clear"))
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                // here for calculation reason

                                if (fett.text.isEmpty ||
                                    inch.text.isEmpty ||
                                    textController.text.isEmpty) {
                                  print("something is empty");
                                } else {
                                  int valu = int.parse(fett.text) * 12 +
                                      int.parse(inch.text);
                                  double valu2 = valu * 2.54;
                                  valu2 = valu2 / 100;
                                  valu2 = valu2 * valu2;
                                  bmi = int.parse(textController.text) / valu2;

                                  bmiText = bmi!.toStringAsPrecision(4);
                                  setState(() {
                                    isChange = !isChange;
                                  });
                                }

                                setState(() {
                                  isSave = !isSave;
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: Text("Calculate"),
                              ))
                        ],
                      ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: isChange
                      ? Text("Your BMI $bmiText")
                      : Text("Your BMI $bmi"),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 0.5,
            ),
            const SizedBox(
              height: 5,
            ),
            const Icon(
              Icons.health_and_safety,
              size: 240,
              color: Colors.cyan,
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 0.5,
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Status"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("BMI Value"),
                ),
              ],
            ),
            SizedBox(height: 5,),
              const Divider(
              thickness: 0.5,
            ),
            SizedBox(height: 5,),
            Container(
                height: 200,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Very Severly Underweight"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("<=15.9"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Severly Underweight"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("16.0 - 16.9"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Underweight"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("17.0 - 18.4"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Normal weight"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("18.5 - 24.9"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Over weight"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("25.0 - 29.9"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Obese Class I"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("30.0 - 34.9"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Obese Class II"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("35.0 - 39.9"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Obese Class III"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(">=40"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    
                  ],
                )
                )
          ]),
        ),
      ),
    );
  }
}
