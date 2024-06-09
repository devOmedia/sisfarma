import 'package:get/get.dart';

import '../controllers/list_section_controller.dart';

class ListSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListSectionController>(
      () => ListSectionController(),
    );
  }
}
