
import '../../../../core/class/crud.dart';
import '../../../../links.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postData(String username, String email, String phone, String pass) async {
    var res = await crud.postData(AppLinks.signup, {
      "users_name": username,
      "users_email": email,
      "users_phone": phone,
      "users_pass": pass
    });
    return res.fold((l) => l, (r) => r);
  }
}
