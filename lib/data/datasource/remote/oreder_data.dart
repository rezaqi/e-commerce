
import '../../../core/class/crud.dart';
import '../../../links.dart';

class OrderData {
  Crud crud;

  OrderData(this.crud);

  orderAdd(Map data) async {
    var res = await crud.postData(AppLinks.order, data);
    return res.fold((l) => l, (r) => r);
  }
}
