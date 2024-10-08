// Mocks generated by Mockito 5.4.4 from annotations
// in currency_converter_app/test/src/modules/currencies/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:currency_converter_app/src/core/errors/faliure.dart' as _i9;
import 'package:currency_converter_app/src/core/network/api_helper.dart'
    as _i19;
import 'package:currency_converter_app/src/core/network/network_checker.dart'
    as _i20;
import 'package:currency_converter_app/src/modules/currencies/data/datasource/local/base_local_datasource.dart'
    as _i15;
import 'package:currency_converter_app/src/modules/currencies/data/datasource/remote/base_remote_datasource.dart'
    as _i14;
import 'package:currency_converter_app/src/modules/currencies/data/entities/currency_converter_entity.dart'
    as _i4;
import 'package:currency_converter_app/src/modules/currencies/data/entities/historical_currencies_entity.dart'
    as _i5;
import 'package:currency_converter_app/src/modules/currencies/data/entities/supported_currencies_entity.dart'
    as _i3;
import 'package:currency_converter_app/src/modules/currencies/domain/model/currency_converter_model.dart'
    as _i11;
import 'package:currency_converter_app/src/modules/currencies/domain/model/historical_currencies_model.dart'
    as _i13;
import 'package:currency_converter_app/src/modules/currencies/domain/model/supported_currencies_model.dart'
    as _i10;
import 'package:currency_converter_app/src/modules/currencies/domain/repository/base_repository.dart'
    as _i6;
import 'package:currency_converter_app/src/core/base/base_use_case.dart'
    as _i17;
import 'package:currency_converter_app/src/modules/currencies/domain/usecase/convert_currencies_usecase.dart'
    as _i12;
import 'package:currency_converter_app/src/modules/currencies/domain/usecase/historical_currenies_usecase.dart'
    as _i18;
import 'package:currency_converter_app/src/modules/currencies/domain/usecase/supported_currencies_usecase.dart'
    as _i16;
import 'package:dartz/dartz.dart' as _i2;
import 'package:dio/dio.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponseSupportedCurrenciesEntity_1 extends _i1.SmartFake
    implements _i3.ResponseSupportedCurrenciesEntity {
  _FakeResponseSupportedCurrenciesEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCurrencyConverterEntity_2 extends _i1.SmartFake
    implements _i4.CurrencyConverterEntity {
  _FakeCurrencyConverterEntity_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponseHistoricalCurrenciesEntity_3 extends _i1.SmartFake
    implements _i5.ResponseHistoricalCurrenciesEntity {
  _FakeResponseHistoricalCurrenciesEntity_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUnit_4 extends _i1.SmartFake implements _i2.Unit {
  _FakeUnit_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseRepository_5 extends _i1.SmartFake
    implements _i6.BaseRepository {
  _FakeBaseRepository_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDio_6 extends _i1.SmartFake implements _i7.Dio {
  _FakeDio_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseOptions_7 extends _i1.SmartFake implements _i7.BaseOptions {
  _FakeBaseOptions_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_8<T> extends _i1.SmartFake implements _i7.Response<T> {
  _FakeResponse_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BaseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBaseRepository extends _i1.Mock implements _i6.BaseRepository {
  MockBaseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.ResponseSupportedCurrenciesModel>>
      fetchsupportedCurrencies() => (super.noSuchMethod(
            Invocation.method(
              #fetchsupportedCurrencies,
              [],
            ),
            returnValue: _i8.Future<
                _i2.Either<_i9.Failure,
                    _i10.ResponseSupportedCurrenciesModel>>.value(_FakeEither_0<
                _i9.Failure, _i10.ResponseSupportedCurrenciesModel>(
              this,
              Invocation.method(
                #fetchsupportedCurrencies,
                [],
              ),
            )),
          ) as _i8.Future<
              _i2.Either<_i9.Failure, _i10.ResponseSupportedCurrenciesModel>>);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i11.CurrencyConverterModel>>
      converterTwoCurrencies(_i12.ConvertCurrenciesUseCaseParams? params) =>
          (super.noSuchMethod(
            Invocation.method(
              #converterTwoCurrencies,
              [params],
            ),
            returnValue: _i8.Future<
                    _i2.Either<_i9.Failure, _i11.CurrencyConverterModel>>.value(
                _FakeEither_0<_i9.Failure, _i11.CurrencyConverterModel>(
              this,
              Invocation.method(
                #converterTwoCurrencies,
                [params],
              ),
            )),
          ) as _i8
              .Future<_i2.Either<_i9.Failure, _i11.CurrencyConverterModel>>);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i13.ResponseHistoricalCurrenciesModel>>
      historicalCurrencies() => (super.noSuchMethod(
            Invocation.method(
              #historicalCurrencies,
              [],
            ),
            returnValue: _i8.Future<
                    _i2.Either<_i9.Failure,
                        _i13.ResponseHistoricalCurrenciesModel>>.value(
                _FakeEither_0<_i9.Failure,
                    _i13.ResponseHistoricalCurrenciesModel>(
              this,
              Invocation.method(
                #historicalCurrencies,
                [],
              ),
            )),
          ) as _i8.Future<
              _i2.Either<_i9.Failure, _i13.ResponseHistoricalCurrenciesModel>>);
}

/// A class which mocks [BaseRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBaseRemoteDataSource extends _i1.Mock
    implements _i14.BaseRemoteDataSource {
  MockBaseRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);

  @override
  _i8.Future<_i3.ResponseSupportedCurrenciesEntity>
      fetchsupportedCurrencies() => (super.noSuchMethod(
            Invocation.method(
              #fetchsupportedCurrencies,
              [],
            ),
            returnValue:
                _i8.Future<_i3.ResponseSupportedCurrenciesEntity>.value(
                    _FakeResponseSupportedCurrenciesEntity_1(
              this,
              Invocation.method(
                #fetchsupportedCurrencies,
                [],
              ),
            )),
          ) as _i8.Future<_i3.ResponseSupportedCurrenciesEntity>);

  @override
  _i8.Future<_i4.CurrencyConverterEntity> converterTwoCurrencies(
    String? from,
    String? to,
    double? amount,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #converterTwoCurrencies,
          [
            from,
            to,
            amount,
          ],
        ),
        returnValue: _i8.Future<_i4.CurrencyConverterEntity>.value(
            _FakeCurrencyConverterEntity_2(
          this,
          Invocation.method(
            #converterTwoCurrencies,
            [
              from,
              to,
              amount,
            ],
          ),
        )),
      ) as _i8.Future<_i4.CurrencyConverterEntity>);

  @override
  _i8.Future<_i5.ResponseHistoricalCurrenciesEntity> historicalCurrencies() =>
      (super.noSuchMethod(
        Invocation.method(
          #historicalCurrencies,
          [],
        ),
        returnValue: _i8.Future<_i5.ResponseHistoricalCurrenciesEntity>.value(
            _FakeResponseHistoricalCurrenciesEntity_3(
          this,
          Invocation.method(
            #historicalCurrencies,
            [],
          ),
        )),
      ) as _i8.Future<_i5.ResponseHistoricalCurrenciesEntity>);
}

/// A class which mocks [BaseLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBaseLocalDataSource extends _i1.Mock
    implements _i15.BaseLocalDataSource {
  MockBaseLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);

  @override
  _i8.Future<_i2.Unit> cachedSupportedCurrenciesModelListLocal(
          _i3.ResponseSupportedCurrenciesEntity? model) =>
      (super.noSuchMethod(
        Invocation.method(
          #cachedSupportedCurrenciesModelListLocal,
          [model],
        ),
        returnValue: _i8.Future<_i2.Unit>.value(_FakeUnit_4(
          this,
          Invocation.method(
            #cachedSupportedCurrenciesModelListLocal,
            [model],
          ),
        )),
      ) as _i8.Future<_i2.Unit>);

  @override
  _i8.Future<_i3.ResponseSupportedCurrenciesEntity>
      getSupportedCurrenciesModelListLocal() => (super.noSuchMethod(
            Invocation.method(
              #getSupportedCurrenciesModelListLocal,
              [],
            ),
            returnValue:
                _i8.Future<_i3.ResponseSupportedCurrenciesEntity>.value(
                    _FakeResponseSupportedCurrenciesEntity_1(
              this,
              Invocation.method(
                #getSupportedCurrenciesModelListLocal,
                [],
              ),
            )),
          ) as _i8.Future<_i3.ResponseSupportedCurrenciesEntity>);
}

/// A class which mocks [ConvertCurrenciesUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockConvertCurrenciesUseCase extends _i1.Mock
    implements _i12.ConvertCurrenciesUseCase {
  MockConvertCurrenciesUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.BaseRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBaseRepository_5(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i6.BaseRepository);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i11.CurrencyConverterModel>> execute(
          {required _i12.ConvertCurrenciesUseCaseParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#params: params},
        ),
        returnValue: _i8
            .Future<_i2.Either<_i9.Failure, _i11.CurrencyConverterModel>>.value(
            _FakeEither_0<_i9.Failure, _i11.CurrencyConverterModel>(
          this,
          Invocation.method(
            #execute,
            [],
            {#params: params},
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i11.CurrencyConverterModel>>);
}

/// A class which mocks [SupportedCurrenciesUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSupportedCurrenciesUsecase extends _i1.Mock
    implements _i16.SupportedCurrenciesUsecase {
  MockSupportedCurrenciesUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.BaseRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBaseRepository_5(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i6.BaseRepository);

  @override
  _i8.Future<
      _i2.Either<_i9.Failure, _i10.ResponseSupportedCurrenciesModel>> execute(
          {required _i17.NoParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#params: params},
        ),
        returnValue: _i8.Future<
                _i2.Either<_i9.Failure,
                    _i10.ResponseSupportedCurrenciesModel>>.value(
            _FakeEither_0<_i9.Failure, _i10.ResponseSupportedCurrenciesModel>(
          this,
          Invocation.method(
            #execute,
            [],
            {#params: params},
          ),
        )),
      ) as _i8.Future<
          _i2.Either<_i9.Failure, _i10.ResponseSupportedCurrenciesModel>>);
}

/// A class which mocks [HistoricalCurreniesUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockHistoricalCurreniesUsecase extends _i1.Mock
    implements _i18.HistoricalCurreniesUsecase {
  MockHistoricalCurreniesUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.BaseRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBaseRepository_5(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i6.BaseRepository);

  @override
  _i8.Future<
      _i2.Either<_i9.Failure, _i13.ResponseHistoricalCurrenciesModel>> execute(
          {required _i17.NoParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#params: params},
        ),
        returnValue: _i8.Future<
                _i2.Either<_i9.Failure,
                    _i13.ResponseHistoricalCurrenciesModel>>.value(
            _FakeEither_0<_i9.Failure, _i13.ResponseHistoricalCurrenciesModel>(
          this,
          Invocation.method(
            #execute,
            [],
            {#params: params},
          ),
        )),
      ) as _i8.Future<
          _i2.Either<_i9.Failure, _i13.ResponseHistoricalCurrenciesModel>>);
}

/// A class which mocks [ApiHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiHelper extends _i1.Mock implements _i19.ApiHelper {
  MockApiHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_6(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i7.Dio);

  @override
  set dio(_i7.Dio? _dio) => super.noSuchMethod(
        Invocation.setter(
          #dio,
          _dio,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.BaseOptions get options => (super.noSuchMethod(
        Invocation.getter(#options),
        returnValue: _FakeBaseOptions_7(
          this,
          Invocation.getter(#options),
        ),
      ) as _i7.BaseOptions);

  @override
  set options(_i7.BaseOptions? _options) => super.noSuchMethod(
        Invocation.setter(
          #options,
          _options,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);

  @override
  _i8.Future<_i7.Response<dynamic>> postData({
    required String? url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postData,
          [],
          {
            #url: url,
            #body: body,
            #query: query,
            #headers: headers,
          },
        ),
        returnValue:
            _i8.Future<_i7.Response<dynamic>>.value(_FakeResponse_8<dynamic>(
          this,
          Invocation.method(
            #postData,
            [],
            {
              #url: url,
              #body: body,
              #query: query,
              #headers: headers,
            },
          ),
        )),
      ) as _i8.Future<_i7.Response<dynamic>>);

  @override
  _i8.Future<_i7.Response<dynamic>> getData({
    required String? url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getData,
          [],
          {
            #url: url,
            #query: query,
            #headers: headers,
          },
        ),
        returnValue:
            _i8.Future<_i7.Response<dynamic>>.value(_FakeResponse_8<dynamic>(
          this,
          Invocation.method(
            #getData,
            [],
            {
              #url: url,
              #query: query,
              #headers: headers,
            },
          ),
        )),
      ) as _i8.Future<_i7.Response<dynamic>>);
}

/// A class which mocks [NetWorkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetWorkInfo extends _i1.Mock implements _i20.NetWorkInfo {
  @override
  _i8.Future<bool> get isDeviceConnected => (super.noSuchMethod(
        Invocation.getter(#isDeviceConnected),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
        returnValueForMissingStub: <Object?>[],
      ) as List<Object?>);
}
