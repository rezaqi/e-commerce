class LoginModel {
  String? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  String? usersPass;
  int? usersVerfiycode;
  int? usersApprove;
  String? usersCreate;

  LoginModel(
      {this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPhone,
      this.usersPass,
      this.usersVerfiycode,
      this.usersApprove,
      this.usersCreate});

  LoginModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'].toString();
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersPass = json['users_pass'];
    usersVerfiycode = json['users_verfiycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['users_id'] = usersId;
    data['users_name'] = usersName;
    data['users_email'] = usersEmail;
    data['users_phone'] = usersPhone;
    data['users_pass'] = usersPass;
    data['users_verfiycode'] = usersVerfiycode;
    data['users_approve'] = usersApprove;
    data['users_create'] = usersCreate;
    return data;
  }
}
