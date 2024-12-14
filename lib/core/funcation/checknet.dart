import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    print("online");
    return true;
  } else {
    print("offline");
    return false;
  }
}
















// Future<dynamic> checkNet() async {
//   try {
//     var res = await InternetAddress.lookup("https://www.google.com");
//     if (res.isNotEmpty) {
//       print(res);
//       return true;
//     }
//   } on SocketException catch (_) {
//     return false;
//   }
// }

