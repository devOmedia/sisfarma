import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sisfarma/app/core/utils/extensions.dart';
import 'package:sisfarma/app/modules/home/controllers/home_controller.dart';

import '../../../../core/themes/app_color.dart';
import '../../../../core/utils/dimensions.dart';

class BottomNavBar extends GetView<HomeController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0.hp,
      color: Colors.grey.shade900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => controller.scaffoldKey.currentState?.openDrawer(),
            icon: Icon(
              Icons.menu,
              color: CMColors.secondaryColor,
              size: CmDimensions.defaultIcon,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: CMColors.secondaryColor,
                ),
                shape: BoxShape.circle),
            child: IconButton(
              onPressed: () => showOptionsBtns(context),
              icon: Icon(
                Icons.add,
                color: CMColors.secondaryColor,
                size: CmDimensions.defaultIcon,
              ),
            ),
          ),
          IconButton(
            onPressed: () => showCategoryDialog(context),
            icon: Icon(
              Icons.filter_alt_outlined,
              color: CMColors.secondaryColor,
              size: CmDimensions.defaultIcon,
            ),
          ),
        ],
      ),
    );
  }

  ListTile optionsItems({title, isChecked, onPressed}) {
    return ListTile(
      contentPadding:
          EdgeInsets.symmetric(horizontal: CmDimensions.defaultPaddingMargin),
      leading: Transform.scale(
        scale: 1.5,
        child: Checkbox(
          value: isChecked,
          shape: const CircleBorder(),
          onChanged: onPressed,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  ///===================================================>>>>options btn dialog
  showOptionsBtns(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: EdgeInsets.all(CmDimensions.defaultPaddingMargin),
          width: Get.width,
          //height: CmDimensions.heightOneOfThree,

          /// + 5.0.hp
          child: Obx(() {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'ADD PASSES/CARDS',
                  style: TextStyle(
                    fontSize: CmDimensions.fontSizeDefault * 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                optionsItems(
                  title: 'Scan Barcode',
                  isChecked: controller.isBarCode.value,
                  onPressed: (_) => controller.onOptionButtonTrigger('barcode'),
                ),
                optionsItems(
                  title: 'Create card manually',
                  isChecked: controller.isManuallyCard.value,
                  onPressed: (_) =>
                      controller.onOptionButtonTrigger('manualCard'),
                ),
                optionsItems(
                  title: 'Pick from phone storage',
                  isChecked: controller.isPhoneStorage.value,
                  onPressed: (_) =>
                      controller.onOptionButtonTrigger('phoneStorage'),
                ),
                // ListTile(
                //   contentPadding: EdgeInsets.symmetric(
                //       horizontal: CmDimensions.defaultPaddingMargin),
                //   leading: Transform.scale(
                //     scale: 1.5,
                //     child: Checkbox(
                //       value: controller.isDeletePasses.value,
                //       shape: const RoundedRectangleBorder(),
                //       onChanged: (value) => controller.isDeletePasses.value =
                //           !controller.isDeletePasses.value,
                //     ),
                //   ),
                //   title: const Text(
                //     'Include deleted passes',
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                //const Spacer(),
                SizedBox(height: 2.0.hp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: CMColors.secondaryColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.onOptionBtnTrigger(context);
                      },
                      child: const Text(
                        'Ok',
                        style: TextStyle(
                          color: CMColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  //==============================================>>> category dialog
  showCategoryDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Obx(() {
          return Container(
            padding: EdgeInsets.all(CmDimensions.defaultPaddingMargin),
            width: Get.width,
            height: CmDimensions.heightOneOfThree,
            child: Column(
              children: [
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: CmDimensions.fontSizeDefault * 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.5.hp),
                GestureDetector(
                  onTap: () =>
                      controller.isCoupon.value = !controller.isCoupon.value,
                  child: Container(
                    padding: EdgeInsets.all(CmDimensions.defaultPaddingMargin),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: controller.isCoupon.value
                            ? CMColors.secondaryColor
                            : Colors.black,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: CMColors.secondaryColor)),
                    child: Center(
                      child: Text(
                        'Coupon',
                        style: TextStyle(
                            fontSize: CmDimensions.fontSizeDefault * 2,
                            fontWeight: FontWeight.w500,
                            color: controller.isCoupon.value
                                ? Colors.black
                                : Colors.white),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: CMColors.secondaryColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Ok',
                        style: TextStyle(
                          color: CMColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
