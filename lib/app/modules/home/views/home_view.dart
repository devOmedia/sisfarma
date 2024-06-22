import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sisfarma/app/core/utils/dimensions.dart';
import 'package:sisfarma/app/core/utils/extensions.dart';

import '../../../core/themes/app_color.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: appBar(context),
      drawer: buildDrawer(),
      body: Column(
        children: [
          const Expanded(child: SizedBox.expand()),
          navMenuSection(context),
        ],
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      backgroundColor: Colors.grey.shade900,
      child: Obx(() {
        return ListView(
          children: [
            SizedBox(height: 4.0.hp),
            ListTile(
              onTap: () {
                controller.isArchive.value = true;
                controller.isPolicy.value = false;
                Get.back();
              },
              tileColor: controller.isArchive.value
                  ? Colors.black
                  : Colors.grey.shade900,
              // contentPadding: EdgeInsets.symmetric(
              //     horizontal: CmDimensions.defaultPaddingMargin),
              leading: Icon(
                Icons.archive_outlined,
                color: CMColors.secondaryColor,
                size: CmDimensions.defaultIcon * 2,
              ),
              title: Text(
                'ARCHIVE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: CmDimensions.fontSizeDefault * 2,
                ),
              ),
              trailing: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Text('0'),
              ),
            ),
            ListTile(
              onTap: () {
                controller.isArchive.value = false;
                controller.isPolicy.value = true;
                Get.back();
                Get.snackbar(
                  "Soon",
                  "Coming soon",
                  icon: const  Icon(Icons.error),
                );

              },
              tileColor: controller.isPolicy.value
                  ? Colors.black
                  : Colors.grey.shade900,
              // contentPadding: EdgeInsets.symmetric(
              //     horizontal: CmDimensions.defaultPaddingMargin),
              leading: Icon(
                Icons.privacy_tip_outlined,
                color: CMColors.secondaryColor,
                size: CmDimensions.defaultIcon * 2,
              ),
              title: Text(
                'Privacy policy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: CmDimensions.fontSizeDefault * 2,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

//============================>>> appbar
  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Obx(
        () {
          return !controller.isArchive.value
              ? RichText(
                  text: TextSpan(
                    text: 'List',
                    style: Theme.of(context).textTheme.headlineSmall,
                    children: [
                      if (controller.isCoupon.value)
                        const TextSpan(text: ' (COUPON)')
                    ],
                  ),
                )
              : Text(
                  'ARCHIVE',
                  style: Theme.of(context).textTheme.headlineSmall,
                );
        },
      ),
      centerTitle: true,
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

  ///===================================================>>>>options btn
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
          height: CmDimensions.heightOneOfThree + 5.0.hp,
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
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: CmDimensions.defaultPaddingMargin),
                  leading: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: controller.isDeletePasses.value,
                      shape: const RoundedRectangleBorder(),
                      onChanged: (value) => controller.isDeletePasses.value =
                          !controller.isDeletePasses.value,
                    ),
                  ),
                  title: const Text(
                    'Include deleted passes',
                    style: TextStyle(
                      color: Colors.white,
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
                      onPressed: () => controller.onOptionBtnTrigger(),
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

  Widget navMenuSection(context) {
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
}
