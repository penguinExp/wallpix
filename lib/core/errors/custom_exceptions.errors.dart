import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class DataParsingException extends Equatable implements Exception {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NoConnectionException extends Equatable implements Exception {
  @override
  List<Object?> get props => throw UnimplementedError();
}
