import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetWorkInfoImpl implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;

  NetWorkInfoImpl({required this.dataConnectionChecker});

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
