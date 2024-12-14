import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/view/screens/acc/account.dart';
import 'package:rezaqi_ecommerce/view/screens/acc/order/archive.dart';
import 'package:rezaqi_ecommerce/view/screens/acc/order/pending.dart';
import 'package:rezaqi_ecommerce/view/screens/auth/check_email.dart';
import 'package:rezaqi_ecommerce/view/screens/auth/forget%20passwoed/forget_password.dart';
import 'package:rezaqi_ecommerce/view/screens/auth/forget%20passwoed/succes_rest_password.dart';
import 'package:rezaqi_ecommerce/view/screens/auth/forget%20passwoed/verfy_email_forget.dart';
import 'package:rezaqi_ecommerce/view/screens/auth/login.dart';
import 'package:rezaqi_ecommerce/view/screens/auth/singup.dart';
import 'package:rezaqi_ecommerce/view/screens/auth/start_sing.dart';
import 'package:rezaqi_ecommerce/view/screens/cart.dart';
import 'package:rezaqi_ecommerce/view/screens/checkout.dart';
import 'package:rezaqi_ecommerce/view/screens/home/home.dart';
import 'package:rezaqi_ecommerce/view/screens/home/home_screen.dart';
import 'package:rezaqi_ecommerce/view/screens/items.dart';
import 'package:rezaqi_ecommerce/view/screens/myfavorite.dart';
import 'package:rezaqi_ecommerce/view/screens/notification.dart';
import 'package:rezaqi_ecommerce/view/screens/onbording.dart';
import 'package:rezaqi_ecommerce/view/screens/product.dart';
import 'package:rezaqi_ecommerce/view/screens/setting.dart/address/address.dart';
import 'package:rezaqi_ecommerce/view/screens/setting.dart/address/map.dart';

import 'core/constant/routs_name.dart';
import 'core/middleware/my_middleware.dart';
import 'view/screens/acc/order/detils.dart';
import 'view/screens/auth/forget passwoed/rest_password.dart';
import 'view/screens/auth/succes_singup.dart';

List<GetPage<dynamic>>? routs = [
  // GetPage(name: "/", page: () => const Test()),
  // GetPage(name: "/", page: () => const TestView()),
  GetPage(
      name: "/", page: () => const OnBording(), middlewares: [MyMiddleware()]),
  GetPage(name: AppRouts.auth, page: () => const Auth()),
  GetPage(name: AppRouts.checkEmail, page: () => const CheckEmail()),
  GetPage(name: AppRouts.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRouts.login, page: () => const LogIn()),
  GetPage(name: AppRouts.restPassword, page: () => const RestPassword()),
  GetPage(name: AppRouts.singup, page: () => const SingUp()),
  GetPage(name: AppRouts.succesRest, page: () => const SuccesRestPassword()),
  GetPage(name: AppRouts.succesSingUp, page: () => const SuccesSingUp()),
  GetPage(
      name: AppRouts.verfyEmailForget, page: () => const VerfyEmailForget()),
  GetPage(name: AppRouts.homePage, page: () => const HomePage()),
  GetPage(name: AppRouts.items, page: () => const ItemsPage()),
  GetPage(name: AppRouts.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRouts.product, page: () => const Products()),
  GetPage(name: AppRouts.myfavorite, page: () => const MyFavorite()),
  GetPage(name: AppRouts.cart, page: () => const Cart()),
  GetPage(name: AppRouts.address, page: () => const Address()),
  GetPage(name: AppRouts.map, page: () => const MapLocaltion()),
  GetPage(name: AppRouts.checkout, page: () => const Checkout()),
  GetPage(name: AppRouts.account, page: () => const Account()),
  GetPage(name: AppRouts.orderPending, page: () => const OrderPending()),
  GetPage(name: AppRouts.notification, page: () => const NotificationPage()),
  GetPage(name: AppRouts.detils, page: () => const Detils()),
  GetPage(name: AppRouts.archive, page: () => const Archive()),
];
