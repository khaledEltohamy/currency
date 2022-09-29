import '../../domain/entites/currency_entity.dart';

class ResponseCurrencyModel extends ResponseCurrencyEntity {
  const ResponseCurrencyModel({required super.currencies});
  factory ResponseCurrencyModel.fromJson(Map<String, dynamic> json) =>
      ResponseCurrencyModel(
          currencies: MapCurrencyModel.fromJson(json['results']));

  @override
  List<Object?> get props => [];
}

class MapCurrencyModel extends MapCurrencyEntity {
  const MapCurrencyModel({required super.currencyMap});
  factory MapCurrencyModel.fromJson(Map<String, dynamic> json) {
    return MapCurrencyModel(
        currencyMap: List<CurrencyModel>.from(
            json.values.map((currency) => CurrencyModel.fromJson(currency))));
  }

  @override
  List<Object?> get props => [];
}

class CurrencyModel extends CurrencyEntity {
  const CurrencyModel(
      {required super.currencyName,
      required super.currencySymbol,
      required super.id});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        currencyName: json['currencyName'] ?? "",
        currencySymbol: json['currencySymbol'] ?? "",
        id: json['id'],
      );

  @override
  List<Object?> get props => [];
}
