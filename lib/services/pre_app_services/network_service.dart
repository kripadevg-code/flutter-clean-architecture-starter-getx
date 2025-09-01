import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:healthbuxus/utils/utility.dart';

class NetworkService {
  NetworkService._internal();
  static final NetworkService _instance = NetworkService._internal();

  final _connectivity = Connectivity();
  var isConnected = false;
  var isInitialized = false;
  StreamSubscription<ConnectivityResult>? _streamSubscription;
  final StreamController<bool> _connectionStatusController = StreamController<bool>.broadcast();

  //getters
  Stream<bool> get connectionStatus => _connectionStatusController.stream.asBroadcastStream();
  static NetworkService get instance => _instance;

  void close() {
    _streamSubscription?.cancel();
    _connectionStatusController.close();
    isInitialized = false;
  }

  Future<void> initialize() async {
    AppUtility.log('NetworkController Initializing');

    if (isInitialized) {
      AppUtility.log('NetworkController Already Initialized');
      return;
    }

    _checkForInternetConnectivity();
    AppUtility.log('NetworkController Initialized');
  }

  void _checkForInternetConnectivity() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        isConnected = true;
        _connectionStatusController.add(true);
        AppUtility.log('Internet Connection Available');
      } else if (result == ConnectivityResult.wifi) {
        isConnected = true;
        _connectionStatusController.add(true);
        AppUtility.log('Internet Connection Available');
      } else {
        isConnected = false;
        _connectionStatusController.add(false);
        AppUtility.log('No Internet Connection');
      }
    });
  }
}
