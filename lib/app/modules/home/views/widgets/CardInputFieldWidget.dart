import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sisfarma/app/core/utils/extensions.dart';
import 'package:sisfarma/app/modules/home/controllers/home_controller.dart';

import '../../../../core/utils/dimensions.dart';

class CardInputFieldWidget extends GetView<HomeController> {
  const CardInputFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin:
      //     EdgeInsets.symmetric(horizontal: CmDimensions.defaultPaddingMargin)
      //         .copyWith(bottom: CmDimensions.defaultPaddingMargin),
      padding: EdgeInsets.all(CmDimensions.defaultPaddingMargin),
      width: Get.width,
      //height: CmDimensions.heightOneOfThree,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          textInputField(
            label: 'Name',
            controller: controller.nameCtr,
            inputType: TextInputType.name,
          ),
          textInputField(
            label: 'Surname',
            controller: controller.surNameCtr,
            inputType: TextInputType.name,
          ),
          textInputField(
            label: 'EAN',
            controller: controller.eanCtr,
            inputType: TextInputType.number,
          ),
          SizedBox(height: 1.0.hp),
          barcodeImage(),
        ],
      ),
    );
  }

  TextField textInputField({label, controller, inputType}) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 6),
        labelText: label,
        hintStyle: const TextStyle(color: Colors.black),
        focusedBorder: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
      ),
    );
  }

  Obx barcodeImage() {
    return Obx(() {
      return Column(
        children: [
          ///==================>>> barcode default logo.
          Visibility(
            visible: controller.barcodeImage.isEmpty,
            child: GestureDetector(
              onTap: () => controller.startBarcodeScan(),
              child: SvgPicture.asset(
                'assets/svg/bar-code.svg',
                width: Get.width,
                height: CmDimensions.heightOneOfEight,
              ),
            ),
          ),

          ///===================>>> barcode image
          Visibility(
            visible: controller.barcodeImage.isNotEmpty,
            child: GestureDetector(
              onTap: () => controller.startBarcodeScan(),
              child: SvgPicture.string(
                controller.barcodeImage.value,
                width: Get.width,
                height: CmDimensions.heightOneOfEight,
              ),
            ),
          ),
        ],
      );
    });
  }
}
