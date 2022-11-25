import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:pesa/screens/insights_screen.dart';

enum MerchantType { food, shopping, travel, entertainment, education, other }

class SpendsScreen extends StatefulWidget {
  static const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  const SpendsScreen({super.key});

  @override
  State<SpendsScreen> createState() => _SpendsScreenState();
}

class _SpendsScreenState extends State<SpendsScreen> {
  final query = SmsQuery();
  List<Map<String, dynamic>> txns = [];
  double totalAmountThisMonth = 0;

  @override
  void initState() {
    super.initState();
    query.querySms(kinds: [SmsQueryKind.inbox]).then((value) {
      List<Map<String, dynamic>> temp = [];
      for (var element in value) {
        if (element.date != null &&
            element.date!.month == DateTime.now().month &&
            element.body.toString().contains("debited") &&
            element.body.toString().contains("Rs") &&
            element.body.toString().contains("transfer to")) {
          final id = element.date!.millisecondsSinceEpoch;
          final amount = double.parse(
              element.body.toString().split("Rs")[1].split(" ")[0]);
          final date = element.date!.toString().split(" ")[0];
          final to =
              element.body.toString().split("transfer to ")[1].split(" Ref")[0];

          totalAmountThisMonth += amount;
          temp.add({
            "id": id,
            "amount": amount,
            "date": date,
            "to": to,
            "type": MerchantType.values[Random().nextInt(6)]
          });
        }
      }
      setState(() {
        txns = temp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/jisha.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Hi Jisha",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.settings_outlined,
                  size: 24,
                  color: Colors.white,
                ),
                const Icon(
                  CupertinoIcons.chevron_right,
                  size: 18,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Your",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Row(
              children: [
                Text(
                  SpendsScreen.months[DateTime.now().month - 1].toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Text(
                  " spends",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: const EdgeInsets.all(0),
              color: const Color(0xff242424),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () => Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (context) {
                  double food = 0;
                  double shopping = 0;
                  double travel = 0;
                  double entertainment = 0;
                  double education = 0;
                  double other = 0;

                  for (var element in txns) {
                    switch (element["type"]) {
                      case MerchantType.food:
                        food += element["amount"];
                        break;
                      case MerchantType.shopping:
                        shopping += element["amount"];
                        break;
                      case MerchantType.travel:
                        travel += element["amount"];
                        break;
                      case MerchantType.entertainment:
                        entertainment += element["amount"];
                        break;
                      case MerchantType.education:
                        education += element["amount"];
                        break;
                      case MerchantType.other:
                        other += element["amount"];
                        break;
                    }
                  }

                  return InsightsScreen(
                    data: {
                      "Food": food,
                      "Shopping": shopping,
                      "Travel": travel,
                      "Entertainment": entertainment,
                      "Education": education,
                      "Other": other,
                    },
                  );
                })),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "₹$totalAmountThisMonth",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Text("View Insights"),
                      const Icon(
                        CupertinoIcons.chevron_right,
                        color: Colors.white,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Transaction History"),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              itemBuilder: (context, index) => Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff242424),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: txns[index]["type"].toString(),
                          dropdownColor: const Color(0xff242424),
                          items: [
                            DropdownMenuItem(
                              value: MerchantType.food.toString(),
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.restaurant_menu,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: MerchantType.shopping.toString(),
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.pink,
                                child: Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: MerchantType.travel.toString(),
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.purple,
                                child: Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: MerchantType.entertainment.toString(),
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.movie_filter,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: MerchantType.education.toString(),
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.school,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: MerchantType.other.toString(),
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.yellow,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) => setState(() {
                            txns[index]["type"] = value!;
                          }),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              txns[index]["to"].toString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            txns[index]["date"].toString(),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Text("₹${txns[index]["amount"]}"),
                    ],
                  ),
                ),
              ),
              itemCount: txns.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
