import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/loading/loading_circular.dart';
import '../../../domain/model/historical_currencies_model.dart';
import '../../bloc/historical_currency_bloc/historical_currency_bloc.dart';

class HistoricalList extends StatelessWidget {
  const HistoricalList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricalCurrencyBloc, HistoricalCurrencyState>(
      builder: (context, state) {
        if (state is HistoricalCurrencyLoading) {
          return const LoadingCircularWidget();
        }
        if (state is HistoricalCurrencyField) {
          return  Center(child: Text("${state.error}"));
        }
          if (state is HistoricalCurrencyOffline) {
          return  Center(child: Text("${state.error}"));
        }
        if (state is HistoricalCurrencySuccess) {
          return _historicalSectionSuccess(state.historicalList);
        } else {
          return const Center(child: Text("Some thing wrong"));
        }
      },
    );
  }

  Widget _historicalSectionSuccess(List<HistoricalCurrenciesModel> historicalList) =>
      SizedBox(
        height: 150,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: historicalList.length,
            itemBuilder: (context, index) => Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "BASE : ${historicalList[index].base}",
                            style:const  TextStyle(fontWeight: FontWeight.w600),
                          ),
                           const  SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${historicalList[index].ratesModel[0].currency} :${historicalList[index].ratesModel[0].value}",
                            style:const  TextStyle(fontWeight: FontWeight.w600),
                          ),
                         const  SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${historicalList[index].ratesModel[1].currency} :${historicalList[index].ratesModel[1].value}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                               ),
                          ),
                          Spacer(),
                          Text(
                            "Date: ${historicalList[index].date}",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                               ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      );
}
