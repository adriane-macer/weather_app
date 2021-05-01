import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetGap extends StatelessWidget {
  const WidgetGap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Get.height * .02);
  }
}