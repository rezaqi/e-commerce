
import '../../../core/class/crud.dart';
import '../../../links.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFav(String userId, String itemId) async {
    var res = await crud.postData(
        AppLinks.favoriteAdd, {"userId": userId, "itemId": itemId.toString()});
    return res.fold((l) => l, (r) => r);
  }

  removeFav(String userId, String itemId) async {
    var res = await crud.postData(AppLinks.favoriteRemove,
        {"userId": userId, "itemId": itemId.toString()});
    return res.fold((l) => l, (r) => r);
  }

  myfavorite(String id) async {
    var res = await crud.postData(AppLinks.myfavorite, {"id": id.toString()});
    return res.fold((l) => l, (r) => r);
  }

  removeMyfavorite(String id) async {
    var res =
        await crud.postData(AppLinks.removeMyfavorite, {"id": id.toString()});
    return res.fold((l) => l, (r) => r);
  }
}
