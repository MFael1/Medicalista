import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/core/middleware/my_middleware.dart';
import 'package:medicalista/view/screens/auth/language.dart';
import 'package:medicalista/view/screens/auth/login.dart';
import 'package:medicalista/view/screens/auth/signup.dart';
import 'package:medicalista/view/screens/auth/success_page.dart';
import 'package:medicalista/view/screens/home_page.dart';
import 'package:medicalista/view/screens/onboarding_screen.dart';
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
  // GetPage(name: "/", page: () => const SuccessPage()),
];
