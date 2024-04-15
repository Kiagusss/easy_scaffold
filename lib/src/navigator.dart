import 'package:flutter/material.dart';
import 'package:get/get.dart';

void backPage() => Navigator.of(Get.context!).pop();

void backPageWithResult(dynamic result) =>
    Navigator.of(Get.context!).pop(result);

void openPage(Widget page) => Navigator.push(
      Get.context!,
      MaterialPageRoute(builder: (context) => page),
    );

Future<dynamic> openPageWithResult(Widget page) async {
  return await Navigator.push(
    Get.context!,
    MaterialPageRoute(builder: (context) => page),
  );
}

