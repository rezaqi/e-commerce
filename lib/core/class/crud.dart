import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:rezaqi_ecommerce/core/class/status_request.dart';
import '../funcation/checknet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String link, Map data) async {
    try {
      if (await checkInternetConnection()) {
        var res = await http.post(Uri.parse(link), body: data);
        if (res.statusCode == 200 || res.statusCode == 201) {
          print(res.body);
          Map resBody = jsonDecode(res.body);
          return Right(resBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      print('%%%%%%%%%%%%%%%%%%%%%%% error &&&&&&&&&&&&&&&&&');
      print(_);
      return const Left(StatusRequest.serverExpection);
    }
  }
}
