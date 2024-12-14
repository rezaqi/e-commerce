class AppLinks {
  // ======================== server =========================== //
  static const String serverEmalutor = "http://10.0.2.2/ecommerce";
  static const String serverGoogle = "http://localhost/ecommerce";

// =========================== Users ============================ //
  static String users = "$serverEmalutor/test.php";

// =========================== notification ============================ //
  static String notification = "$serverEmalutor/notification.php";

  // =========================== images ============================ //
  static String imageCat = "$serverEmalutor/upload/categories";
  static String imageItem = "$serverEmalutor/upload/item";

// =========================== Auth ============================== //
  static String signup = "$serverEmalutor/auth/signup.php";
  static String login = "$serverEmalutor/auth/login.php";

// =========================== Home ============================== //
  static String home = "$serverEmalutor/home.php";

// =========================== Items ============================== //
  static String items = "$serverEmalutor/items/items.php";

  // =========================== favorite ============================== //
  static String favoriteAdd = "$serverEmalutor/favorite/add.php";
  static String favoriteRemove = "$serverEmalutor/favorite/remove.php";
  static String myfavorite = "$serverEmalutor/favorite/myfavorite.php";
  static String removeMyfavorite =
      "$serverEmalutor/favorite/removemyfavorite.php";

// ========================== cart =================================== //
  static String cart = "$serverEmalutor/cart/cart.php";
  static String addCart = "$serverEmalutor/cart/add.php";
  static String cartDelete = "$serverEmalutor/cart/delete.php";
  static String cartCount = "$serverEmalutor/cart/count.php";
  static String carView = "$serverEmalutor/cart/cartview.php";

// ========================== search ================================ //
  static String search = "$serverEmalutor/items/search.php";

// =========================== Address ============================= //
  static String addressAdd = "$serverEmalutor/address/add.php";
  static String addressView = "$serverEmalutor/address/view.php";
  static String addressEdit = "$serverEmalutor/address/Edit.php";
  static String addressDelete = "$serverEmalutor/address/delete.php";

// =========================== coupon ============================= //
  static String coupon = "$serverEmalutor/coupon/check.php";

  // =========================== order ============================= //
  static String order = "$serverEmalutor/order/checkout.php";
  static String orderPending = "$serverEmalutor/order/pending.php";
  static String orderDetils = "$serverEmalutor/order/detils.php";
  static String orderDelet = "$serverEmalutor/order/delete.php";
  static String orderArchive = "$serverEmalutor/order/archive.php";

  // =========================== offers ============================= //
  static String offers = "$serverEmalutor/offers/view.php";

  // ============================= rating ============================ //
// static String itemsRating = "$serverEmalutor/items/rating/view.php";
  static String ratingAdd = "$serverEmalutor/items/rating/add.php";
}
