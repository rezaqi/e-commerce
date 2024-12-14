
import '../../../../../core/class/crud.dart';
import '../../../../../links.dart';

class OrderArchiveData {
  Crud crud;
  OrderArchiveData(this.crud);

  getData(String userId) async {
    var res = await crud.postData(AppLinks.orderArchive, {"userid": userId});
    return res.fold((l) => l, (r) => r);
  }

  addRaingData(String orderId, String rating, String comment) async {
    var res = await crud.postData(AppLinks.ratingAdd,
        {"orderid": orderId.toString(), "rating": rating, "comment": comment});
    return res.fold((l) => l, (r) => r);
  }
}
