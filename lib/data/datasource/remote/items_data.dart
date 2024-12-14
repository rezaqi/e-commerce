
import '../../../core/class/crud.dart';
import '../../../links.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String id, String userId) async {
    var res = await crud.postData(
        AppLinks.items, {"id": id.toString(), "userId": userId.toString()});
    return res.fold((l) => l, (r) => r);
  }

  getItemRating(String itemId) async {
    var res =
        await crud.postData(AppLinks.ratingAdd, {"itemId": itemId.toString()});
    return res.fold((l) => l, (r) => r);
  }
}
