import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/historical_currency_bloc/historical_currency_bloc.dart';

class HistoricalList extends StatelessWidget {
  const HistoricalList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricalCurrencyBloc, HistoricalCurrencyState>(
      builder: (context, state) {
        if (state is HistoricalCurrencyLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HistoricalCurrencyField) {
          return const Center(child: Text("Something wrong"));
        }
        if (state is HistoricalCurrencySuccess) {
          return _historicalSectionSuccess(state.historicalList);
        } else {
          return const Center(child: Text("Some thing wrong"));
        }
      },
    );
  }

  Widget _historicalSectionSuccess(List<Map<String, dynamic>> historicalList) =>
      SizedBox(
        height: 90,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: historicalList.length,
            itemBuilder: (context, index) => Card(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "PHP_USD: ${historicalList[index].values.toString().substring(13, 22)}",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "USD_PHP: ${historicalList[index].values.toString().substring(38, 46)}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            "Date: ${historicalList[index].values.toString().substring(2, 12)}",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      );
}
