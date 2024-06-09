import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/listSection/bindings/list_section_binding.dart';
import '../modules/listSection/views/list_section_view.dart';
import '../modules/menuSection/bindings/menu_section_binding.dart';
import '../modules/menuSection/views/menu_section_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MENU_SECTION,
      page: () => const MenuSectionView(),
      binding: MenuSectionBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.LIST_SECTION,
      page: () => const ListSectionView(),
      binding: ListSectionBinding(),
    ),
  ];
}
