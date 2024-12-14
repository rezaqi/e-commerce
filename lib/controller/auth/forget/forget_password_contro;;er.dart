import 'package:get/get.dart';

import '../../../core/constant/routs_name.dart';

abstract class ForgetPasswordController extends GetxController {
  check();
  goToVerfyForget();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  @override
  check() {}

  @override
  goToVerfyForget() {
    Get.toNamed(AppRouts.verfyEmailForget);
  }
}
