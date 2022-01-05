import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ImageWidget extends StatelessWidget {
  final String assetImageAdress;
  const ImageWidget({Key? key, required this.assetImageAdress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        assetImageAdress,
        fit: BoxFit.cover,
      height: Get.height/2.5,
      width: Get.width,
    );
  }
}
