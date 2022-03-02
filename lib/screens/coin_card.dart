import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CoinCard extends StatelessWidget {
  CoinCard({
    Key? key,
    required this.currentPrice,
    required this.dayChange,
    required this.id,
    required this.imageURL,
    required this.marketCap,
    required this.symbol,
    required this.colorChange,
  }) : super(key: key);
  int id;
  String symbol;
  String imageURL;
  double currentPrice;
  double dayChange;
  int marketCap;
  bool colorChange;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,##,000');
    bool price = currentPrice > 1000;
    return Container(
      padding: const EdgeInsets.fromLTRB(
        10,
        2,
        10,
        5,
      ),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Color.fromARGB(255, 243, 239, 239),
            width: 0.1,
          ),
        ),
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
                  '$id',
                  style: GoogleFonts.lato(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          imageURL,
                        ),
                      ),
                    ),
                    Text(
                      symbol.toUpperCase(),
                      style: styleFont(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(10),
          Text(
            price ? '\$${formatter.format(currentPrice)}' : '\$$currentPrice',
            style: styleFont(),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                colorChange ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                color: colorChange ? Colors.red : Colors.green,
              ),
              Text(
                colorChange
                    ? dayChange.toStringAsFixed(1).substring(1)
                    : dayChange.toStringAsFixed(1),
                style: TextStyle(
                  color: colorChange ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
          const Gap(10),
          Text(
            '\$${formatter.format(marketCap)}',
            style: styleFont(),
          ),
        ],
      ),
    );
  }

  TextStyle styleFont() {
    return GoogleFonts.lato(
      color: Colors.white,
    );
  }
}
