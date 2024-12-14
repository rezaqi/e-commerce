
import '../../../core/class/crud.dart';
import '../../../links.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getData(String userId) async {
    var res = await crud.postData(AppLinks.addressView, {"id": userId});

    return res.fold((l) => l, (r) => r);
  }

  addData(String userId, String title, String city, String street, String lat,
      String long) async {
    var res = await crud.postData(AppLinks.addressAdd, {
      "userId": userId,
      "name": title,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    print("!!!!!!!!!!!!!!!!!!!!!!!!!");
    print(res);
    return res.fold((l) => l, (r) => r);
  }

  editData(String userId, String title, String city, String street, String lan,
      String long) async {
    var res = await crud.postData(AppLinks.addressEdit, {
      "id": userId,
      "name": title,
      "city ": city,
      "street": street,
      "lan": lan,
      "long": long,
    });
    return res.fold((l) => l, (r) => r);
  }

  deleteData(String addressId) async {
    var res = await crud.postData(AppLinks.addressDelete, {"id": addressId});
    return res.fold((l) => l, (r) => r);
  }
}
