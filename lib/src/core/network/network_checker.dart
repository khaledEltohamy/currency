import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetWorkInfo extends Equatable{
  Future<bool> get isDeviceConnected;
}

class NetworkChecker extends NetWorkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkChecker({required this.internetConnectionChecker});
  @override
  Future<bool> get isDeviceConnected => internetConnectionChecker.hasConnection;
  
  @override
  List<Object?> get props => [internetConnectionChecker.hasConnection];
}
