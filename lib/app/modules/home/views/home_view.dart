import 'package:flutter/cupertino.dart';
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
          navMenuSection(),
        ],
      ),
    );
  }

  Widget navMenuSection() {
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
              onPressed: null,
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
