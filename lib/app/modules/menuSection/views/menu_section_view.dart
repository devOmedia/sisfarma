import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/menu_section_controller.dart';

class MenuSectionView extends GetView<MenuSectionController> {
  const MenuSectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MenuSectionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MenuSectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
