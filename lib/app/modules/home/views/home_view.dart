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
      appBar: AppBar(
        title: Text(
          'List',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: CMColors.secondaryColor,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.question_mark,
                color: CMColors.secondaryColor,
                size: CmDimensions.defaultIcon,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Expanded(child: SizedBox.expand()),
          navMenuSection(context),
        ],
      ),
    );
  }

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
          height: CmDimensions.heightHalf,
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
                  title: 'Take image of card',
                  isChecked: controller.isCardImage.value,
                  onPressed: (_) =>
                      controller.onOptionButtonTrigger('imageOfCard'),
                ),
                optionsItems(
                  title: 'Open PDF or image',
                  isChecked: controller.isOpenPdf.value,
                  onPressed: (_) =>
                      controller.onOptionButtonTrigger('openPdforImage'),
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
                      onPressed: () {},
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
            onPressed: null,
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
            onPressed: null,
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
