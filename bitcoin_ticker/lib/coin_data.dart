import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

String key = '0F556C50-72C8-4339-A512-CCB45DDA47AC';

class CoinData {
  Future getPrice(String coin, String currency) async {
    if (!cryptoList.contains(coin) || !currenciesList.contains(currency)) return;

    Uri url = Uri.https('rest.coinapi.io', 'v1/exchangerate/$coin/$currency');

    var response = await http.get(url, headers: {
      'X-CoinAPI-Key': key,
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('Error trying to retrieve data from CoinAPI');
    }

    return ;
  }
}
