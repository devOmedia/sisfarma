import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_section_controller.dart';

class ListSectionView extends GetView<ListSectionController> {
  const ListSectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListSectionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListSectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
