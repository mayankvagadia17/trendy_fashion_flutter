import 'package:connectivity_plus/connectivity_plus.dart';

bool isNetworkAvail = true;

Future<bool> isNetworkAvailable() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult[0] == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult[0] == ConnectivityResult.wifi) {
    return true;
  }
  return true;
}
