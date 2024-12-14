
import '../../../../../core/class/crud.dart';
import '../../../../../links.dart';

class OrderDetilsData {
  Crud crud;
  OrderDetilsData(this.crud);

  getData(String cartOrderId) async {
    var res =
        await crud.postData(AppLinks.orderDetils, {"cartorder": cartOrderId});
    return res.fold((l) => l, (r) => r);
  }
}
