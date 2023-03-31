import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  PriceScreenState createState() => PriceScreenState();
}

class PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  CoinData coinData = CoinData();
  late Map<String, String> cryptoData = {};

  DropdownButton androidDropdown() {
    return DropdownButton(
      value: selectedCurrency,
      items: currenciesList.map((currency) => DropdownMenuItem(
        value: currency,
        child: Text(currency),
      )).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedCurrency = newValue.toString();
        });
        getCryptoRate();
      }
    );
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (newValue) {
        setState(() {
          selectedCurrency = newValue.toString();
        });
        getCryptoRate();
      },
      children: currenciesList.map((currency) => Text(currency)).toList(),
    );
  }

  List<Card> getCoinCards() {
    List<Card> coinCards = [];
    for (String coin in cryptoList) {
      coinCards.add(
        Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $coin = ${cryptoData[coin]} $selectedCurrency',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        )
      );
    }

    return coinCards;
  }

  void getCryptoRate() async {
    for (String coin in cryptoList) {
      var response = await coinData.getPrice(coin, selectedCurrency);
      dynamic result = jsonDecode(response);
      updateUI(result);
    }
  }

  void updateUI(dynamic cryptoRate) {
    setState(() {
        cryptoData[cryptoRate['asset_id_base']] = cryptoRate['rate'].toStringAsFixed(2);
    });
  }

  @override
  void initState() {
    super.initState();

    getCryptoRate();

    print(cryptoData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getCoinCards(),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
