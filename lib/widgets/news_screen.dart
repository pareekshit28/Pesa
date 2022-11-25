import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesa/networking/apis.dart';
import 'package:pesa/screens/webview_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

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
                  Icons.newspaper_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "News",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: Apis.getNews(),
              builder: (context, snapshot) => snapshot.hasData
                  ? ListView.separated(
                      itemBuilder: (context, index) => Card(
                        margin: const EdgeInsets.all(0),
                        color: const Color(0xff242424),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => WebViewScreen(
                                    url: snapshot.data["articles"][index]["url"]
                                        .toString(),
                                    title: snapshot.data["articles"][index]
                                            ["source"]["name"]
                                        .toString())));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Image.network(
                                    snapshot.data["articles"][index]
                                            ["urlToImage"]
                                        .toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    snapshot.data["articles"][index]["title"]
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    snapshot.data["articles"][index]["source"]
                                            ["name"]
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                    )),
                                Text(
                                    snapshot.data["articles"][index]
                                            ["publishedAt"]
                                        .toString()
                                        .split("T")[0], //get date
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      itemCount: snapshot.data["articles"].length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 10,
                      ),
                    )
                  : const Center(child: Text("Loading...")),
            ),
          ],
        ),
      ),
    );
  }
}
