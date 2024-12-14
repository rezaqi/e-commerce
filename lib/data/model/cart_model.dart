class CartModel {
  dynamic itemPrice;
  int? itemSelect;
  int? cartId;
  int? cartUser;
  int? cartItem;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  dynamic itemsTotalPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;

  CartModel(
      {this.itemPrice,
      this.itemSelect,
      this.cartId,
      this.cartUser,
      this.cartItem,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsTotalPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemPrice = json['itemsprice'];
    itemSelect = json['countitems'];
    cartId = json['cart_id'];
    cartUser = json['cart_user'];
    cartItem = json['cart_item'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsTotalPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemprice'] = this.itemPrice;
    data['itemscount'] = this.itemSelect;
    data['cart_id'] = this.cartId;
    data['cart_user'] = this.cartUser;
    data['cart_item'] = this.cartItem;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsTotalPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}
