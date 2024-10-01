import 'package:currency_converter_app/src/core/constants/strings/app_strings.dart';
import 'package:currency_converter_app/src/utils/date_time/date_time_formater.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() async{
  late Dio dio;
  late DioAdapter dioAdapter;
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setUp((){
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
  });
  group("Api", () { 
 final headers = <String, List<String>>{  
        "Accept":["application/json"],
        "Content-Type": ["application/json"],};
  
  test("List of supported currencies with their country’s flag", () {
  headers.addAll({AppString.key.cloudmersiveKeyName : [AppString.key.cloudmersiveKey]});
      dioAdapter.onPost(AppString.url.cloudmersive, (server) { 
        server.reply(200, {} , headers: headers);
      });
    });

  test("Historical data for 2 currencies of your choosing for the last 7 days", () {
        String date = "i".getYesterday(1);
       dioAdapter.onGet("${AppString.url.exchangeratesapi}v1/$date?${AppString.key.exchangeratesapiKeyName}=${AppString.key.exchangeratesapiKey}&symbols=USD,CAD", (server) { 
        server.reply(200, {},  headers: headers);
      });
    });

  test("Currency converter where the user can select 2 currencies with the amount to convert", () {
         dioAdapter.onGet("${AppString.url.currencylayer}/convert?${AppString.key.currencylayerKeyName}=${AppString.key.currencylayerKey}&from=EUR&to=USD&amount=10", 
        (server) { 
        server.reply(200, {}, headers: headers );
      });
    });
     test("Currency converter where the user can select 2 currencies with the amount to convert", () {
         dioAdapter.onGet("${AppString.url.currencylayer}/convert?${AppString.key.currencylayerKeyName}=${AppString.key.currencylayerKey}&from=EUR&to=USD&amount=10", 
        (server) { 
        server.reply(200, {}, headers: headers );
      });
    });
    
  });
}