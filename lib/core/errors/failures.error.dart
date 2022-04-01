import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  const Failure({this.properties = const <dynamic>[]}) : super();

  @override
  List<Object?> get props => [properties];
}

// Some general failures
class ServerFailure extends Failure {}

class DataParsingFailure extends Failure {}

class ConnectivityFailure extends Failure {}

class SearchFailure extends Failure {}
