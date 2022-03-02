import 'dart:convert';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symfonia/data/crypto_list.dart';
import 'package:symfonia/model/coins_list.dart';

import 'coin_card.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({Key? key}) : super(key: key);

  @override
  _CoinsPageState createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<CryptoList>(context, listen: false).getCoins();
  }

  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<CryptoList>(context);

    //dataprovider.getCoins();
    return Scaffold(
      backgroundColor: const Color(
        0xFF1F2D2D,
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(
          0xFF1F2D2D,
        ),
        elevation: 5,
        title: Text(
          'Symfonia',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: dataprovider.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            )
          : RefreshIndicator(
              color: Colors.grey,
              onRefresh: () => dataprovider.getCoins(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '#',
                                style: headingStyle(),
                              ),
                              Text(
                                'COIN',
                                style: headingStyle(),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'PRICE',
                          style: headingStyle(),
                        ),
                        Text(
                          '24H',
                          style: headingStyle(),
                        ),
                        Text(
                          'MARKET CAP',
                          style: headingStyle(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: dataprovider.coinList.length,
                      itemBuilder: (context, index) {
                        final data = dataprovider.coinList[index];
                        bool colorsChange = data.dayChange.toString()[0] == '-';
                        return CoinCard(
                          colorChange: colorsChange,
                          currentPrice: data.currentPrice.toDouble(),
                          dayChange: data.dayChange.toDouble(),
                          id: data.id.toInt(),
                          imageURL: data.image,
                          marketCap: data.marketCap.toInt(),
                          symbol: data.symbol,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  TextStyle headingStyle() {
    return GoogleFonts.lato(
      color: Colors.grey,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
  }
}
