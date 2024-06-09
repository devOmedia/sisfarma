import 'package:get/get.dart';

extension PercentSized on num {
  double get hp => Get.height * (this / 100);
  double get wp => Get.width * (this / 100);
}