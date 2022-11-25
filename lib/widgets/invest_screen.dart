import 'package:flutter/material.dart';
import 'package:pesa/networking/apis.dart';

class InvestScreen extends StatefulWidget {
  const InvestScreen({super.key});

  @override
  State<InvestScreen> createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
  final investController = TextEditingController();
  final getController = TextEditingController();
  bool find = false;
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.business_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Invest",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff242424),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Invest",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: TextField(
                                controller: investController,
                                style: const TextStyle(fontSize: 16),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: "0.00",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "To get",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: TextField(
                                controller: getController,
                                style: const TextStyle(fontSize: 16),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: "0.00",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: const Color(0xff242424),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (investController.text != "" &&
                      getController.text != "" &&
                      investController.text != "0" &&
                      getController.text != "0") {
                    setState(() {
                      find = true;
                    });
                  }
                },
                child: const Text("Find Investements",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            find
                ? const Text(
                    "Matching Investements",
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            find
                ? FutureBuilder(
                    future: Apis.getStocks(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List stocks = [];
                        for (var stock in snapshot.data['data']) {
                          if (stock["perChange365d"] > 0) {
                            stocks.add(stock);
                          }
                        }
                        stocks.sort((a, b) =>
                            b["perChange365d"].compareTo(a["perChange365d"]));
                        return ListView.separated(
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
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      index == 0
                                          ? stocks[index]["symbol"]
                                          : stocks[index]["meta"]["companyName"]
                                              .toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      "${((((int.parse(getController.text) - int.parse(investController.text)) / int.parse(investController.text)) * 100) / stocks[index]["perChange365d"]).toStringAsFixed(2)} Years",
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          itemCount: stocks.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 10,
                          ),
                        );
                      }

                      return const Center(child: Text("Loading..."));
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
