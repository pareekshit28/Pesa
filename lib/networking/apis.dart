import 'package:pesa/networking/api_helper.dart';

class Apis {
  static Future getNews() async {
    //get news from newsapi.org
    return await ApiHelper.getRequest(
        "https://newsapi.org/v2/top-headlines?category=business&country=in&apiKey=1c813c30a4594af1bddd056aa2cd947a");
  }

  static Future getStocks() async {
    //get stocks from nseindia.com
    return await ApiHelper.getRequest(
        "https://www.nseindia.com/api/equity-stockIndices?index=NIFTY%2050");
  }

  static Future getCrypto() async {
    //get crypto from coindesk.com
    return await ApiHelper.getRequest(
        "https://production.api.coindesk.com/v2/tb/price/ticker?assets=BTC,ETH,XRP,BCH,EOS,XLM,LTC,ADA,XMR,DASH,IOTA,TRX,NEO,ETC,XEM,ZEC,BTG,LSK,QTUM,BSV,DOGE,DCR,USDT,USDC,LINK,XTZ,ZRX,DAI,BAT,OXT,ALGO,ATOM,KNC,OMG,ANT,REP,BAND");
  }

  static Future getForex() async {
    //get forex from exchangeratesapi.io
    return await ApiHelper.getRequest(
        "https://api.apilayer.com/exchangerates_data/latest?base=INR&apikey=gUtLAOgYA07lbkU9Wqvvjdgxc1EIfZ4b");
  }
}
