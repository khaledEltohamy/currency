import 'package:currency_converter_app/src/core/constants/strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'src/core/injection/app_injections.dart' as di;
import 'src/modules/currencies/presentation/bloc/converter_currencies_bloc/converter_currencies_bloc.dart';
import 'src/modules/currencies/presentation/bloc/currencies_bloc/currencies_bloc.dart';
import 'src/modules/currencies/presentation/bloc/historical_currency_bloc/historical_currency_bloc.dart';
import 'src/modules/currencies/presentation/cubit/converter_list_cubit/converter_list_cubit.dart';
import 'src/modules/currencies/presentation/view/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
   Hive.init(dir.path);
  await Hive.openBox(AppString.cachedCurrencyBoxKey);
  await di.init();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              di.getIt<CurrenciesBloc>()..add(GetSupportedCurrenciesEvent()),
        ),
        BlocProvider(
          create: (context) => di.getIt<ConverterListCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<ConverterCurrenciesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<HistoricalCurrencyBloc>()
            ..add(GetHistoricalCurrencyEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Currency app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
