import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symfonia/data/crypto_list.dart';
import 'package:symfonia/screens/coins_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CryptoList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CoinsPage(),
      ),
    );
  }
}