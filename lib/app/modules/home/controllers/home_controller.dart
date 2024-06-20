import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isBarCode = false.obs;
  RxBool isCardImage = false.obs;
  RxBool isOpenPdf = false.obs;
  RxBool isManuallyCard = false.obs;
  RxBool isPhoneStorage = false.obs;
  RxBool isDeletePasses = false.obs;

  String selectedOption = '';

  //drawer
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  onOptionButtonTrigger(selectedOption) {
    switch (selectedOption) {
      case 'barcode':
        isBarCode.value = true;
        isCardImage.value = false;
        isOpenPdf.value = false;
        isManuallyCard.value = false;
        isPhoneStorage.value = false;
        break;
      case 'imageOfCard':
        isBarCode.value = false;
        isCardImage.value = true;
        isOpenPdf.value = false;
        isManuallyCard.value = false;
        isPhoneStorage.value = false;
        break;
      case 'openPdforImage':
        isBarCode.value = false;
        isCardImage.value = false;
        isOpenPdf.value = true;
        isManuallyCard.value = false;
        isPhoneStorage.value = false;
        break;
      case 'manualCard':
        isBarCode.value = false;
        isCardImage.value = false;
        isOpenPdf.value = false;
        isManuallyCard.value = true;
        isPhoneStorage.value = false;
        break;
      case 'phoneStorage':
        isBarCode.value = false;
        isCardImage.value = false;
        isOpenPdf.value = false;
        isManuallyCard.value = false;
        isPhoneStorage.value = true;
        break;
    }
  }
}