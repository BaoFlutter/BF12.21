import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Screen"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.four_k_rounded),
          onPressed: (){
            Get.back(); // Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
