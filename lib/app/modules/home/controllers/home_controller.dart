import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:sisfarma/app/core/utils/extensions.dart';
import 'package:sisfarma/app/modules/home/models/card_model.dart';

import '../../../core/themes/app_color.dart';
import '../views/widgets/CardInputFieldWidget.dart';

class HomeController extends GetxController {
  RxBool isBarCode = false.obs;
  RxBool isManuallyCard = false.obs;
  RxBool isPhoneStorage = false.obs;
  RxBool isDeletePasses = false.obs;

  //list
  RxList<CardModel> allCardList = <CardModel>[].obs;

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
        isManuallyCard.value = false;
        isPhoneStorage.value = false;
        break;
      case 'manualCard':
        isBarCode.value = false;
        isManuallyCard.value = true;
        isPhoneStorage.value = false;
        break;
      case 'phoneStorage':
        isBarCode.value = false;
        isManuallyCard.value = false;
        isPhoneStorage.value = true;
        break;
    }
  }

  ///=====================================>>> store card
  void storeList() {
    allCardList.add(
      CardModel(
        barcode: barcodeImage.value,
        name: nameCtr.text,
        surname: surNameCtr.text,
        ean: eanCtr.text,
      ),
    );
    resetValues();
  }

  resetValues() {
    barcodeImage.value = '';
    barCodeResult.value = '';
    nameCtr.clear();
    surNameCtr.clear();
    eanCtr.clear();
  }

  ///=========================================>>> on option button pressed
  onOptionBtnTrigger(BuildContext context) {
    if (isBarCode.value) {
      startBarcodeScan().then((value) {
        if (barCodeResult.isNotEmpty) {
          openAddNewCardDialog(context);
        }
      });
    } else if (isManuallyCard.value) {
      openAddNewCardDialog(context);
    }
  }

  ///==================================>>> manual card dialog.
  openAddNewCardDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) =>
          Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CardInputFieldWidget(),
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
                        if (nameCtr.text.isNotEmpty &&
                            surNameCtr.text.isNotEmpty) {
                          Get.back();
                          storeList();
                        } else {
                          Get.snackbar(
                            "Empty Fields",
                            "Please enter name and surname",
                            icon: const Icon(Icons.error),
                          );
                        }
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
            ),
          ),
    );
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
        generateBarcode(barcodeScanRes);
        Get.snackbar('Success', 'Valid barcode scanned: $barcodeScanRes');
      } else {
        Get.snackbar('Failed', 'Invalid barcode.');
      }
    } on PlatformException {
      Get.snackbar('Failed', 'Failed to get platform version.');
    }
  }

  ///convert barcode image
  void generateBarcode(String data) {
    final bc = Barcode.code128();
    barcodeImage.value =
        bc.toSvg(data, width: 300, height: 80, drawText: false,);
  }
}
