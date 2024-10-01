import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/supported_currencies_model.dart';
import '../../bloc/currencies_bloc/currencies_bloc.dart';
import '../../../../../core/widget/cards/currency_card.dart';

class CurrenciesList extends StatelessWidget {
  const CurrenciesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesBloc, CurrenciesState>(
        builder: (context, state) {
      if (state is  SupportedCurrenciesLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is  SupportedCurrenciesSuccess) {
        List<SupportedCurrenciesModel> listItems =
            state.supportedCurrencies;
        return _currenciesWithFlagsSuccess(listItems);
      }
      if (state is  SupportedCurrenciesFialure) {
        return  Center(
          child: Text("${state.error}"),
        );
      }
      if (state is  SupportedCurrenciesOffline) {
        return  Center(
          child: Text("${state.error}"),
        );
      } else {
        return const Center(
          child: Text("Something wrong"),
        );
      }
    });
  }

  Widget _currenciesWithFlagsSuccess(List<SupportedCurrenciesModel> listItems) =>
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: listItems.length,
        itemBuilder: (context, index) => CurrencyCard(
          model: listItems[index],
          isadded: true,
        ),
      );
}
