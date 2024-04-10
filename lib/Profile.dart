import 'package:bmi_cal/my_plans.dart';
import 'package:bmi_cal/plan_create.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher_string.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Icon(
                    Icons.person,
                    size: 34,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Your Profile",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Expanded(
                    child: SizedBox(
                  height: 5,
                )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => MyPlans()));
                    print("Taped");
                  },
                  child: const Text(
                    "See Your Plans",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => PlanCreate()));
                    print("Taped");
                  },
                  child: const Text(
                    "Create a Plan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    final url = Uri.parse(
                        "https://www.nhlbi.nih.gov/health/educational/lose_wt/index.htm");
                    if (await canLaunchUrlString(url.toString())){
                      // Corrected
                      await launcher.launchUrl(url); // Corrected
                    }
                  },
                  child: const Text(
                    "Health Tips",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
