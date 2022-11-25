import 'package:flutter/material.dart';
import 'package:pesa/networking/apis.dart';

class TrendsScreen extends StatefulWidget {
  const TrendsScreen({super.key});

  @override
  State<TrendsScreen> createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  String? choice = 'stocks';
  List<String> cryptos = [
    "BTC",
    "ETH",
    "XRP",
    "BCH",
    "EOS",
    "XLM",
    "LTC",
    "ADA",
    "XMR",
    "DASH",
    "IOTA",
    "TRX",
    "NEO",
    "ETC",
    "XEM",
    "ZEC",
    "BTG",
    "LSK",
    "QTUM",
    "BSV",
    "DOGE",
    "DCR",
    "USDT",
    "USDC",
    "LINK",
    "XTZ",
    "ZRX",
    "DAI",
    "BAT",
    "OXT",
    "ALGO",
    "ATOM",
    "KNC",
    "OMG",
    "ANT",
    "REP",
    "BAND",
  ];

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
                  Icons.trending_up_sharp,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Trends",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: const Color(0xff242424),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      isExpanded: true,
                      value: choice,
                      dropdownColor: const Color(0xff242424),
                      items: [
                        DropdownMenuItem(
                          value: "stocks",
                          child: Row(
                            children: const [
                              Icon(
                                Icons.trending_up,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Stocks",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: "crypto",
                          child: Row(
                            children: const [
                              Icon(
                                Icons.currency_bitcoin,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Cryptocurrencies",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: "forex",
                          child: Row(
                            children: const [
                              Icon(
                                Icons.currency_exchange,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Forex",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          choice = value;
                        });
                      }),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            choice == "stocks"
                ? FutureBuilder(
                    future: Apis.getStocks(),
                    builder: (context, snapshot) => snapshot.hasData
                        ? ListView.separated(
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text(
                                            index == 0
                                                ? snapshot.data["data"][index]
                                                    ["symbol"]
                                                : snapshot.data["data"][index]
                                                        ["meta"]["companyName"]
                                                    .toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          snapshot.data["data"][index]["symbol"]
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                        "${snapshot.data["data"][index]["pChange"]}%",
                                        style: TextStyle(
                                          color: snapshot.data["data"][index]
                                                      ["pChange"]
                                                  .toString()
                                                  .contains(
                                                      "-") //check if the value is negative
                                              ? Colors.red
                                              : Colors.green,
                                        )),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    snapshot.data["data"][index]["pChange"]
                                            .toString()
                                            .contains(
                                                "-") //check if the value is negative
                                        ? const Icon(Icons.arrow_downward,
                                            color: Colors.red)
                                        : const Icon(Icons.arrow_upward,
                                            color: Colors.green),
                                  ],
                                ),
                              ),
                            ),
                            itemCount: snapshot.data["data"].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: 10,
                            ),
                          )
                        : const Center(child: Text("Loading...")),
                  )
                : const SizedBox(),
            choice == "crypto"
                ? FutureBuilder(
                    future: Apis.getCrypto(),
                    builder: (context, snapshot) => snapshot.hasData
                        ? ListView.separated(
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text(
                                            snapshot.data["data"]
                                                    [cryptos[index]]["name"]
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          snapshot.data["data"][cryptos[index]]
                                                  ["iso"]
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                        "${snapshot.data["data"][cryptos[index]]["change"]["percent"].toString().substring(0, 4)}%",
                                        style: TextStyle(
                                          color: snapshot.data["data"]
                                                      [cryptos[index]]["change"]
                                                      ["percent"]
                                                  .toString()
                                                  .contains(
                                                      "-") //check if the value is negative
                                              ? Colors.red
                                              : Colors.green,
                                        )),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    snapshot.data["data"][cryptos[index]]
                                                ["change"]["percent"]
                                            .toString()
                                            .contains(
                                                "-") //check if the value is negative
                                        ? const Icon(Icons.arrow_downward,
                                            color: Colors.red)
                                        : const Icon(Icons.arrow_upward,
                                            color: Colors.green),
                                  ],
                                ),
                              ),
                            ),
                            itemCount: cryptos.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: 10,
                            ),
                          )
                        : const Center(child: Text("Loading...")),
                  )
                : const SizedBox(),
            choice == "forex"
                ? FutureBuilder(
                    future: Apis.getForex(),
                    builder: (context, snapshot) => snapshot.hasData
                        ? ListView.separated(
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
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Text(
                                        snapshot.data["rates"].keys
                                            .toList()[index]
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        child: Text(
                                          "${(1 / snapshot.data["rates"].values.toList()[index]).toStringAsFixed(2)} INR",
                                          textAlign: TextAlign.end,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            itemCount: snapshot.data["rates"].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: 10,
                            ),
                          )
                        : const Center(child: Text("Loading...")),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
