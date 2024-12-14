
import '../../../links.dart';

import '../../../core/class/crud.dart';

class CouponData {
  Crud crud;
  CouponData(this.crud);

  getData(String name) async {
    var res = await crud.postData(AppLinks.coupon, {"name": name});
    return res.fold((l) => l, (r) => r);
  }
}
