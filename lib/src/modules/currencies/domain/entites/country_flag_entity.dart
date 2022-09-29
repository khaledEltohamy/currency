import 'package:equatable/equatable.dart';

abstract class ResponseCountryFlagEntity extends Equatable {
  final List<String> images;

  ResponseCountryFlagEntity({required this.images});
}
