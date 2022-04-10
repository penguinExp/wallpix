import 'package:equatable/equatable.dart';

abstract class CustomFailure extends Equatable {
  final String errorMsg;

  const CustomFailure({this.errorMsg = ''});

  @override
  List<Object?> get props => [errorMsg];
}
