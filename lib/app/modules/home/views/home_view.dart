import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sisfarma/app/core/utils/dimensions.dart';
import 'package:sisfarma/app/core/utils/extensions.dart';
import 'package:sisfarma/app/modules/home/views/widgets/bottom_nav_bar.dart';

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
          Obx(() {
            return Expanded(
              child: ListView.separated(
                itemCount: controller.allCardList.length,
                itemBuilder: (context, index) {
                  final data = controller.allCardList[index];
                  return Container(
                    margin: EdgeInsets.symmetric(
                            horizontal: CmDimensions.defaultPaddingMargin)
                        .copyWith(bottom: CmDimensions.defaultPaddingMargin),
                    padding: EdgeInsets.all(CmDimensions.defaultPaddingMargin),
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Name: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: CmDimensions.fontSizeDefault * 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: data.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: CmDimensions.fontSizeDefault * 1.5,
                                ),
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Surname: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: CmDimensions.fontSizeDefault * 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: data.surname,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: CmDimensions.fontSizeDefault * 1.5,
                                ),
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'EAN: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: CmDimensions.fontSizeDefault * 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: data.ean,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: CmDimensions.fontSizeDefault * 1.5,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 1.0.hp),
                        data.barcode.isNotEmpty
                            ? SvgPicture.string(
                                data.barcode,
                                width: Get.width,
                                height: CmDimensions.heightOneOfEight,
                              )
                            : SizedBox(
                                width: Get.width,
                                height: CmDimensions.heightOneOfEight,
                              )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 1.0.hp),
              ),
            );
          }),
          // const CardInputFieldWidget(),
          const BottomNavBar(),
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
                  icon: const Icon(Icons.error),
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
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall,
              children: [
                if (controller.isCoupon.value)
                  const TextSpan(text: ' (COUPON)')
              ],
            ),
          )
              : Text(
            'ARCHIVE',
            style: Theme
                .of(context)
                .textTheme
                .headlineSmall,
          );
        },
      ),
      centerTitle: true,
    );
  }
}
