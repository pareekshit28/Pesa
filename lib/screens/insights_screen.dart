import 'package:flutter/material.dart';
import 'package:pesa/widgets/spends_screen.dart';
import 'package:pie_chart/pie_chart.dart';

class InsightsScreen extends StatelessWidget {
  final Map<String, double> data;
  const InsightsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        title: const Text('Insights',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Card(
                margin: const EdgeInsets.all(0),
                color: const Color(0xff242424),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, bottom: 24, left: 32),
                  child: PieChart(
                    dataMap: data,
                    animationDuration: const Duration(milliseconds: 1200),
                    chartLegendSpacing: 50,
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    colorList: const [
                      Colors.green,
                      Colors.pink,
                      Colors.purple,
                      Colors.red,
                      Colors.blue,
                      Colors.yellow,
                    ],
                    initialAngleInDegree: 0,
                    chartType: ChartType.ring,
                    ringStrokeWidth: 8,
                    centerText: SpendsScreen.months[DateTime.now().month - 1]
                        .toString(),
                    legendOptions: const LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.right,
                      showLegends: true,
                      // legendShape: _BoxShape.circle,
                      legendTextStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: true,
                      decimalPlaces: 1,
                      chartValueBackgroundColor: Color(0xff484848),
                      chartValueStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Category Wise Spending",
              ),
              const SizedBox(height: 20),
              Card(
                margin: const EdgeInsets.all(0),
                color: const Color(0xff242424),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.restaurant_menu,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("Food",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        const Spacer(),
                        Text("₹${data["Food"]}", //amount spent on food
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                      ],
                    )),
              ),
              const SizedBox(height: 10),
              Card(
                margin: const EdgeInsets.all(0),
                color: const Color(0xff242424),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.pink,
                          child: Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("Shopping",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        const Spacer(),
                        Text("₹${data["Shopping"]}", //amount spent on shopping
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                      ],
                    )),
              ),
              const SizedBox(height: 10),
              Card(
                margin: const EdgeInsets.all(0),
                color: const Color(0xff242424),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.purple,
                          child: Icon(
                            Icons.airplanemode_active,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("Travel",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        const Spacer(),
                        Text("₹${data["Travel"]}", //amount spent on travel
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                      ],
                    )),
              ),
              const SizedBox(height: 10),
              Card(
                margin: const EdgeInsets.all(0),
                color: const Color(0xff242424),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.red,
                          child: Icon(
                            Icons.movie_filter,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("Entertainment",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        const Spacer(),
                        Text(
                            "₹${data["Entertainment"]}", //amount spent on entertainment
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                      ],
                    )),
              ),
              const SizedBox(height: 10),
              Card(
                margin: const EdgeInsets.all(0),
                color: const Color(0xff242424),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.school,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("Education",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        const Spacer(),
                        Text(
                            "₹${data["Education"]}", //amount spent on education
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                      ],
                    )),
              ),
              const SizedBox(height: 10),
              Card(
                margin: const EdgeInsets.all(0),
                color: const Color(0xff242424),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.yellow,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("Other",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        const Spacer(),
                        Text(
                            "₹${data["Other"]}", //amount spent on other expenses
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
