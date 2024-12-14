
import '../../../core/class/crud.dart';
import '../../../links.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);

  searchData(String search) async {
    var res = await crud.postData(AppLinks.search, {"search": search});
    return res.fold((l) => l, (r) => r);
  }
}
