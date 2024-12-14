
import '../class/status_request.dart';

handling(res) {
  if (res is StatusRequest) {
    print("+++++++++++ handling ++++++++++++");
    print(res);
    return res;
  } else {
    return StatusRequest.succes;
  }
}
