import 'package:connectivity/connectivity.dart';

abstract class ConnectivityService {
  Future<bool> isOffline();
}

class ConnectivityServiceImpl implements ConnectivityService {
  final Connectivity connectivity;

  ConnectivityServiceImpl(this.connectivity);

  @override
  Future<bool> isOffline() async {
    final result = await connectivity.checkConnectivity();
    return result == ConnectivityResult.none;
  }
}
