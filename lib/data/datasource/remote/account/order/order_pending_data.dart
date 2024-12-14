
import '../../../../../core/class/crud.dart';
import '../../../../../links.dart';

class OrderPendingData {
  Crud crud;

  OrderPendingData(this.crud);

  getData(String userId) async {
    var res = await crud.postData(AppLinks.orderPending, {"userid": userId});
    return res.fold((l) => l, (r) => r);
  }

  deletData(String orderTD) async {
    var res = await crud.postData(AppLinks.orderDelet, {"orderid": orderTD});
    return res.fold((l) => l, (r) => r);
  }
}
