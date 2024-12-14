
import '../../../core/class/crud.dart';
import '../../../links.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);

  getData() async {
    var res = await crud.postData(AppLinks.offers, {});
    return res.fold((l) => l, (r) => r);
  }
}
