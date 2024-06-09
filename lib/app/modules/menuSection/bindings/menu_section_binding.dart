import 'package:get/get.dart';

import '../controllers/menu_section_controller.dart';

class MenuSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuSectionController>(
      () => MenuSectionController(),
    );
  }
}
