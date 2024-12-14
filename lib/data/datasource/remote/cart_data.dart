
import '../../../core/class/crud.dart';
import '../../../links.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  getData(String id) async {
    var res = await crud.postData(AppLinks.cart, {"id": id});
    return res.fold((l) => l, (r) => r);
  }

  addCart(String userId, String itemId) async {
    var res = await crud
        .postData(AppLinks.addCart, {"userId": userId, "itemId": itemId});
    return res.fold((l) => l, (r) => r);
  }

  deleteCart(String userId, String itemId) async {
    print("delet");
    var res = await crud
        .postData(AppLinks.cartDelete, {"userId": userId, "itemId": itemId});
    res.fold((l) => l, (r) => r);
  }

  getCountCart(String userId, String itemId) async {
    var res = await crud
        .postData(AppLinks.cartCount, {"userId": userId, "itemId": itemId});
    return res.fold((l) => l, (r) => r);
  }

  view(String userId) async {
    var res = await crud.postData(AppLinks.carView, {'userId': userId});
    return res.fold((l) => l, (r) => r);
  }
}
