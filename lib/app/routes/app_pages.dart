import 'package:get/get.dart';

import '../modules/add_data/bindings/add_data_binding.dart';
import '../modules/add_data/views/add_data_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static get initial => Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DATA,
      page: () => const AddDataView(),
      binding: AddDataBinding(),
    ),
  ];
}
