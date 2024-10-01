
import 'package:currency_converter_app/src/core/errors/exception.dart';
import 'package:currency_converter_app/src/core/errors/faliure.dart';
import 'package:currency_converter_app/src/modules/currencies/data/entities/historical_currencies_entity.dart';
import 'package:currency_converter_app/src/modules/currencies/data/entities/supported_currencies_entity.dart';
import 'package:currency_converter_app/src/modules/currencies/data/repository/repository_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helper/dummy_data/supported_currency_response.dart';
import '../../helper/test_helper.mocks.dart';

void main() {

  late RepositoryImp repository;
  late MockBaseRemoteDataSource mockRemoteDataSource;
  late MockBaseLocalDataSource mockLocalDataSource;
  late MockNetWorkInfo mockNetworkInfo;
  

  setUp(() {
    mockRemoteDataSource = MockBaseRemoteDataSource();
    mockLocalDataSource = MockBaseLocalDataSource();
    mockNetworkInfo = MockNetWorkInfo();
    repository = RepositoryImp(
      remoteDataSource: mockRemoteDataSource, 
      networkChecker: mockNetworkInfo, 
      localDataSource: mockLocalDataSource);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isDeviceConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isDeviceConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  group('Currency Repository', () {
    ResponseHistoricalCurrenciesEntity successHistoricalEntity =ResponseHistoricalCurrenciesEntity(historicalCurrencies: []);
  runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
           when(mockRemoteDataSource.historicalCurrencies())
            .thenAnswer((_) async=> successHistoricalEntity);
        final result = await repository.historicalCurrencies();  
        expect(result.isRight(), true);
        verify(mockRemoteDataSource.historicalCurrencies());
     
      });
   
    });
    test('should return failure when throw exception from datasource',
          () async {
           when(mockRemoteDataSource.historicalCurrencies())
            .thenThrow(ExceptionService());
        final result = await repository.historicalCurrencies();  
        verifyNever(mockRemoteDataSource.historicalCurrencies());
        expect(result.isLeft(), true);
        
     
      });

runTestsOffline((){
  test("should return offline failure when the call to remote data source ", () async{
      when(mockRemoteDataSource.historicalCurrencies())
            .thenAnswer((_) async => successHistoricalEntity);
        final result = await repository.historicalCurrencies();
        verifyNever(mockRemoteDataSource.historicalCurrencies());
        expect(result, Left(FailureOffline()));

  });
  });
});


}