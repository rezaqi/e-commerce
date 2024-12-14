
import '../../../core/class/crud.dart';
import '../../../links.dart';


class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    var res = await crud.postData(AppLinks.home, {});
    return res.fold((l) => l, (r) => r);
  }
}
