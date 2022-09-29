import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/country_currency_entity.dart';
import '../../bloc/currencies_bloc/currencies_bloc.dart';
import 'currency_card.dart';

class CurrenciesList extends StatelessWidget {
  const CurrenciesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesBloc, CurrenciesState>(
        builder: (context, state) {
      if (state is CurrenciesWithFlagsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CurrenciesWithFlagsSuccess) {
        List<CountryCurrencyEntity> listItems =
            state.responseCountryCurrencyEntity;
        return _currenciesWithFlagsSuccess(listItems);
      }
      if (state is CurrenciesWithFlagsField) {
        return const Center(
          child: Text("Something wrong with server please try agin later"),
        );
      }
      if (state is CurrenciesWithFlagsOffline) {
        return const Center(
          child: Text("You are offline , Please check connection and try agin"),
        );
      } else {
        return const Center(
          child: Text("Something wrong"),
        );
      }
    });
  }

  Widget _currenciesWithFlagsSuccess(List<CountryCurrencyEntity> listItems) =>
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: listItems.length,
        itemBuilder: (context, index) => CurrencyCard(
          countryCurrencyEntity: listItems[index],
          isadded: true,
        ),
      );
}
