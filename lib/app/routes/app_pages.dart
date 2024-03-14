import 'package:get/get.dart';
import 'package:tgs4_3/app/modules/home/views/register_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => RegisterView(),
      binding: HomeBinding(),
    ),
  ];
}
