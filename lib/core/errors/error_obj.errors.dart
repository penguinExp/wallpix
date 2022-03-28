import 'package:equatable/equatable.dart';
import 'package:wallpix/core/errors/failures.errors.dart';

class ErrorObject extends Equatable {
  final String title;
  final String msg;

  const ErrorObject({
    required this.title,
    required this.msg,
  });

  @override
  List<Object?> get props => [title, msg];

  static ErrorObject mapFailureToErrorObj({required FailureEntity failure}) {
    return failure.when(
      serverFailure: () => const ErrorObject(
        title: 'Internal Server Failure',
        msg:
            'It seems that the server is not reachable at the moment, try again later',
      ),
      dataParsingFailure: () => const ErrorObject(
        title: 'Data Parsing failure',
        msg:
            'It seems that the app needs to be updated to reflect the changed server data structure! Please update the app',
      ),
      noConnectionFailure: () => const ErrorObject(
        title: 'Opps! No Connection',
        msg:
            'It seems that your device is not connected to the network, please check your connectivity or try again later',
      ),
    );
  }
}
