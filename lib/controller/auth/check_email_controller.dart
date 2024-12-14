import 'package:get/get.dart';
import '../../core/constant/routs_name.dart';

abstract class CheckEmailController extends GetxController {
  check();
  goToSuccesSingUp();
}

class CheckEmailControllerImp extends CheckEmailController {
  @override
  check() {}

  @override
  goToSuccesSingUp() {
    Get.toNamed(AppRouts.succesSingUp);
  }
}
