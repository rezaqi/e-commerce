
import '../../../../core/class/crud.dart';
import '../../../../links.dart';

class LogInData {
  Crud crud;
  LogInData(this.crud);

  postData(String email, String pass) async {
    var res = await crud
        .postData(AppLinks.login, {"users_email": email, "users_pass": pass});
    return res.fold((l) => l, (r) => r);
  }
}
