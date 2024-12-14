class OrderModel {
  String? orderId;
  int? orderUser;
  int? orderAddress;
  int? orderDeliveryprice;
  int? orderPrice;
  dynamic orderTotalprice;
  int? orderCoupon;
  int? orderDiscount;
  String? orderPayment;
  String? orderStatus;
  String? orderTime;
  String? orderRating;
  String? orderComment;
  int? addressId;
  int? addressUser;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  OrderModel(
      {this.orderId,
      this.orderUser,
      this.orderAddress,
      this.orderDeliveryprice,
      this.orderPrice,
      this.orderTotalprice,
      this.orderCoupon,
      this.orderDiscount,
      this.orderPayment,
      this.orderStatus,
      this.orderTime,
      this.orderRating,
      this.orderComment,
      this.addressId,
      this.addressUser,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'].toString();
    orderUser = json['order_user'];
    orderAddress = json['order_address'];
    orderDeliveryprice = json['order_deliveryprice'];
    orderPrice = json['order_price'];
    orderTotalprice = json['order_totalprice'];
    orderCoupon = json['order_coupon'];
    orderDiscount = json['order_discount'];
    orderPayment = json['order_payment'].toString();
    orderStatus = json['order_status'].toString();
    orderTime = json['order_time'];
    orderRating = json['order_rating'].toString();
    orderComment = json['order_comment'].toString();
    addressId = json['address_id'];
    addressUser = json['address_user'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_user'] = this.orderUser;
    data['order_address'] = this.orderAddress;
    data['order_deliveryprice'] = this.orderDeliveryprice;
    data['order_price'] = this.orderPrice;
    data['order_totalprice'] = this.orderTotalprice;
    data['order_coupon'] = this.orderCoupon;
    data['order_discount'] = this.orderDiscount;
    data['order_payment'] = this.orderPayment;
    data['order_status'] = this.orderStatus;
    data['order_time'] = this.orderTime;
    data['order_rating'] = this.orderRating;
    data['order_comment'] = this.orderComment;
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
