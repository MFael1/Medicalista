import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/core/middleware/my_middleware.dart';
import 'package:medicalista/view/screens/auth/language.dart';
import 'package:medicalista/view/screens/auth/login.dart';
import 'package:medicalista/view/screens/auth/signup.dart';
import 'package:medicalista/view/screens/auth/success_page.dart';
import 'package:medicalista/view/screens/cart_page.dart';
import 'package:medicalista/view/screens/change_language.dart';
import 'package:medicalista/view/screens/home_page.dart';
import 'package:medicalista/view/screens/onboarding_screen.dart';
import 'package:medicalista/view/screens/order_details.dart';
import 'package:medicalista/view/screens/orders_page.dart';
import 'package:medicalista/view/screens/product_page.dart';
import 'package:medicalista/view/screens/sections/section_items.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language(), middlewares: [
    MyMiddleWare(),
  ]),
  GetPage(name: AppRoutes.language, page: () => const Language()),
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutes.login, page: () => const LoginPage()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUpPage()),
  GetPage(name: AppRoutes.success, page: () => const SuccessPage()),
  GetPage(name: AppRoutes.homePage, page: () => const HomePage()),
  GetPage(name: AppRoutes.secItems, page: () => const SectionItems()),
  GetPage(name: AppRoutes.product, page: () => const ProductPage()),
  GetPage(name: AppRoutes.cartPage, page: () => const CartPage()),
  GetPage(name: AppRoutes.ordersPage, page: () => const OrdersPage()),
  GetPage(name: AppRoutes.changeLanguage, page: () => const ChangeLanguage()),
  GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetailsPage()),
  // GetPage(name: "/", page: () => const SuccessPage()),
];
