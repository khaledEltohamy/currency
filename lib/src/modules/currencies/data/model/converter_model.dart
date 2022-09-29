class ConverterModel {
  final String firstCurrencyIdConverter;
  final String secondCurrencyIdConverter;

  ConverterModel(
      {required this.firstCurrencyIdConverter,
      required this.secondCurrencyIdConverter});

  factory ConverterModel.fromJson(
          {required dynamic json,
          required dynamic firstCurrencyId,
          required dynamic secondCurrencyId}) =>
      ConverterModel(
          firstCurrencyIdConverter: firstCurrencyId,
          secondCurrencyIdConverter: secondCurrencyId);
}
