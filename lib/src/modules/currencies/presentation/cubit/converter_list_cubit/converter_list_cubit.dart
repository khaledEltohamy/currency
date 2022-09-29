import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entites/country_currency_entity.dart';

part 'converter_list_state.dart';

class ConverterListCubit extends Cubit<List<CountryCurrencyEntity>> {
  ConverterListCubit() : super([]);

  addIteamList(CountryCurrencyEntity countryCurrencyEntity) {
    List<CountryCurrencyEntity> list = List.from(state);
    if (state.length <= 1) {
      list.add(countryCurrencyEntity);
      emit(list);
    } else {
      print("--------field ${state.length}");
    }
  }

  removeIteamList(CountryCurrencyEntity countryCurrencyEntity) {
    List<CountryCurrencyEntity> list = List.from(state);
    var converterList = list.where(
        (element) => element.countryName == countryCurrencyEntity.countryName);
    if (converterList.length > 0) {
      if (list.length >= 0) {
        list.removeWhere((element) =>
            element.country_code_id == countryCurrencyEntity.country_code_id);
        emit(list);
      } else {
        print("state.length >= 0 false");
      }
    } else {
      print("--------state not contauin this iteam");
    }
  }
}
