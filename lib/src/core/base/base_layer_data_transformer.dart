
import 'package:equatable/equatable.dart';
abstract class BaseLayerDataTransformer<F, T> extends Equatable{
  T transform();

  F restore(T data);
}
