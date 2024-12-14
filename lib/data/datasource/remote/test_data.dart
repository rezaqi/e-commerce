
import '../../../core/class/crud.dart';
import '../../../links.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var res = await crud.postData(AppLinks.users, {});
    return res.fold((l) => l, (r) => r);
  }
}
