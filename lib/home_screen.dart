import 'package:bmi_cal/DrawingElement/drawing.dart';
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
  double balance = 0.0;
  String bmiText = "";
  bool isChange = false;
  bool isSave = false;
  int statusIndex = 0;
  bool isStatusChange = false;
  String statusText = "Normal Weight";
  List<String> statuslist = [
    "Very Severly Underweight",
    "Severly Underweight",
    "UnderWwight",
    "Normal Weight",
    "Over Weight",
    "Obese Class I",
    "Obese Class II",
    "Obese Class III"
  ];
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
            Padding(
              padding: const EdgeInsets.only(top:4.0),
              child: Container(
                
                height: 56,
                child: Row(
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
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: fett,
                          cursorWidth: 2,
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
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: inch,
                          cursorWidth: 2,
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
              ),
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
                          const SizedBox(
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
                                  if (bmi! <= 15.9) {
                                    setState(() {
                                      statusText = statuslist[0];
                                      balance = 18.5 * valu2 - bmi! * valu2;
                                      isStatusChange = !isStatusChange;
                                    });
                                  } else if (bmi! >= 16.0 && bmi! <= 16.9) {
                                    setState(() {
                                      statusText = statuslist[1];
                                      balance = 18.5 * valu2 - bmi! * valu2;
                                      isStatusChange = !isStatusChange;
                                    });
                                  } else if (bmi! >= 17.0 && bmi! <= 18.4) {
                                    setState(() {
                                      statusText = statuslist[2];
                                      balance = 18.5 * valu2 - bmi! * valu2;
                                      isStatusChange = !isStatusChange;
                                    });
                                  } else if (bmi! >= 18.5 && bmi! <= 24.9) {
                                    setState(() {
                                      statusText = statuslist[3];
                                      balance = 0.0;
                                      isStatusChange = !isStatusChange;
                                    });
                                  } else if (bmi! >= 25.0 && bmi! <= 29.9) {
                                    setState(() {
                                      statusText = statuslist[4];
                                      balance = 24.9 * valu2 - bmi! * valu2;
                                      isStatusChange = !isStatusChange;
                                    });
                                  } else if (bmi! >= 30.0 && bmi! <= 34.9) {
                                    setState(() {
                                      statusText = statuslist[5];
                                      balance = 24.9 * valu2 - bmi! * valu2;
                                      isStatusChange = !isStatusChange;
                                    });
                                  } else if (bmi! >= 35.0 && bmi! <= 39.9) {
                                    setState(() {
                                      statusText = statuslist[6];
                                      balance = 24.9 * valu2 - bmi! * valu2;
                                      isStatusChange = !isStatusChange;
                                    });
                                  } else if (bmi! >= 40.0) {
                                    setState(() {
                                      statusText = statuslist[7];
                                      balance = 24.9 * valu2 - bmi! * valu2;
                                      isStatusChange = !isStatusChange;
                                    });
                                  } else {
                                    setState(() {
                                      statusText = statuslist[2];
                                      balance = 18.5 * valu2 - bmi! * valu2;
                                      isStatusChange = !isStatusChange;
                                    });
                                  }
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
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: isChange
                      ? Text("Your BMI $bmiText")
                      : Text("Your BMI $bmiText"),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 236,
              child: Column(
                children: [
                  Flexible(child: Drawing()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Your status:",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      isStatusChange
                          ? Text(
                              statusText,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            )
                          : Text(
                              statusText,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Balanced weight(-/+ kg):",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      isStatusChange
                          ? Text(
                              balance.toStringAsPrecision(4),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            )
                          : Text(
                              balance.toStringAsPrecision(4),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                    ],
                  )
                ],
              ),
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
                  child: Text(
                    "Status",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "BMI Value",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
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
            Container(
                height: 230,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Very Severly Underweight",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "<=15.9",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
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
                          child: Text(
                            "Severly Underweight",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "16.0 - 16.9",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
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
                          child: Text(
                            "Underweight",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "17.0 - 18.4",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
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
                          child: Text(
                            "Normal weight",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "18.5 - 24.9",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
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
                          child: Text(
                            "Over weight",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "25.0 - 29.9",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
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
                          child: Text(
                            "Obese Class I",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "30.0 - 34.9",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
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
                          child: Text(
                            "Obese Class II",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "35.0 - 39.9",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
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
                          child: Text(
                            "Obese Class III",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            ">=40",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
