import 'dart:developer';

import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeController extends GetxController {
  RxBool isBarCode = false.obs;
  RxBool isCardImage = false.obs;
  RxBool isOpenPdf = false.obs;
  RxBool isManuallyCard = false.obs;
  RxBool isPhoneStorage = false.obs;
  RxBool isDeletePasses = false.obs;

  //drawer data
  RxBool isArchive = false.obs;
  RxBool isPolicy = false.obs;

  //category
  RxBool isCoupon = false.obs;

  //drawer
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //barcode
  RxString barCodeResult = ''.obs;
  RxString barcodeImage = ''.obs;

  ///controllers
  TextEditingController nameCtr = TextEditingController();
  TextEditingController surNameCtr = TextEditingController();
  TextEditingController eanCtr = TextEditingController();

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

  onOptionBtnTrigger() {
    if (isBarCode.value) {
      startBarcodeScan();
    } else {
      Get.snackbar(
        "Soon",
        "Coming soon",
        icon: const Icon(Icons.error),
      );
    }
  }

  onCategoryDialogTrigger() {
    isCoupon.value = true;
    Get.back();
  }

  ///Barcode scanner
  Future<void> startBarcodeScan() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", // Color of the scan line
          "Cancel", // Text for the cancel button
          true, // Whether to show the flash icon
          ScanMode.BARCODE // Scan mode (QR or Barcode)
          );
      // Validate the barcode result
      if (barcodeScanRes != '-1' && barcodeScanRes.isNotEmpty) {
        barCodeResult.value = barcodeScanRes;
        log('Barcode scan result: $barcodeScanRes');
        generateBarcode(barcodeScanRes);
        Get.snackbar('Success', 'Valid barcode scanned: $barcodeScanRes');
      } else {
        Get.snackbar('Failed', 'Invalid barcode result.');
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
      Get.snackbar('Failed', 'Failed to get platform version.');
    }
  }

  void generateBarcode(String data) {
    final bc = Barcode.code128();
    barcodeImage.value = bc.toSvg(data, width: 300, height: 80);
    log('----------------------->>>> ${barcodeImage.value}');

    // Convert SVG to image
    // final image = im.decodeSvg(svg);
    // final png = im.encodePng(image!);
    // generatedBarcode.value = Uint8List.fromList(png);
  }
}
