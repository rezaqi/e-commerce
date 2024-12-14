
import '../../../core/class/crud.dart';
import '../../../links.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);

  getData(String userId) async {
    var res = await crud.postData(AppLinks.notification, {"userId": userId});
    return res.fold((l) => l, (r) => r);
  }
}
