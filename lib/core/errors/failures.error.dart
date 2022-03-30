import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  const Failure({this.properties = const <dynamic>[]}) : super();

  @override
  List<Object?> get props => [properties];
}


// Some general failures 
class ServerFailure extends Failure {}

class CahceFailure extends Failure {}

class ConnectivityFailure extends Failure {}