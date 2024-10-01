import 'package:flutter/material.dart';

import '../widget/converter_list.dart';
import '../widget/currencies_list.dart';
import '../widget/historical_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            _converterSection(),
            const Divider(),
            _historicalSection(),
            const Divider(),
            _currenciesWithFlagsSection(),
          ],
        ),
      )),
    );
  }

  Widget _converterSection() => Container(
      margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            "Converter two Currencies.",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 16),
          ConverterList(),
        ]
      ));

  Widget _historicalSection() => Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Historical two Currencies last 7 days.",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8,
              ),
              HistoricalList(),
            ]),
      );

  Widget _currenciesWithFlagsSection() => Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "List of supported currencies with their country’s flag.",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 8,
            ),
            CurrenciesList(),
          ],
        ),
      );
}
