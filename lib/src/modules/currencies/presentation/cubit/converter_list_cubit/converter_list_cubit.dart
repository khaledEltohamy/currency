import 'package:bloc/bloc.dart';

import '../../../domain/model/supported_currencies_model.dart';


class ConverterListCubit extends Cubit<List<SupportedCurrenciesModel>> {
  ConverterListCubit() : super([]);

  addIteamList(SupportedCurrenciesModel countryCurrencyEntity) {
    List<SupportedCurrenciesModel> list = List.from(state);
    if (state.length <= 1) {
      list.add(countryCurrencyEntity);
      emit(list);
    } 
  }

  removeIteamList(SupportedCurrenciesModel countryCurrencyEntity) {
    List<SupportedCurrenciesModel> list = List.from(state);
    var converterList = list.where(
        (element) => element.countryName == countryCurrencyEntity.countryName);
    if (converterList.length > 0) {
      if (list.length >= 0) {
        list.removeWhere((element) =>
            element.countryCode == countryCurrencyEntity.countryCode);
        emit(list);
      } else {
        print("state.length >= 0 false");
      }
    } else {
      print("--------state not contauin this iteam");
    }
  }
}
