class AddressModel {
  String? addressId;
  int? addressUser;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  AddressModel(
      {this.addressId,
      this.addressUser,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'].toString();
    addressUser = json['address_user'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_user'] = this.addressUser;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
