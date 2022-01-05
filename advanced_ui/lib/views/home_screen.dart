import 'package:advanced_ui/resources/constants.dart';
import 'package:advanced_ui/resources/widgets/button_item.dart';
import 'package:advanced_ui/resources/widgets/description_widget.dart';
import 'package:advanced_ui/resources/widgets/image_widget.dart';
import 'package:advanced_ui/resources/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            // image Widget
            ImageWidget(assetImageAdress: ASSET_IMAGE_PATH + "image_cover.jpeg"),
            // title Widget
            TitleWidget(
                title: "Oschinen Lake Campground ",
                address: "Kandersteg Switzerland",
                rate: 4),
            // button Widget
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ButtonItem(
                        text: "call",
                        icon: Icons.call,
                        onPressed: (){
                          print("Calling");
                        }),),
                  Expanded(
                    flex: 1,
                    child: ButtonItem(
                        text: "route",
                        icon: Icons.navigation,
                        onPressed: (){
                          print("Routing");
                        }),),
                  Expanded(
                    flex: 1,
                    child: ButtonItem(
                        text: "share",
                        icon: Icons.share,
                        onPressed: (){
                          print("Sharing");
                        }),),
                ],
              ),
            ),
            // description Widget
            DescriptionWidget(text: "Oeschinen Lake or Oeschinensee as the Swiss call it, is one of the best lakes in Switzerland, if not on the earth. Oeschinen Lake lies in the Kandertal valley in Bernese Oberland region of Switzerland. If you love swimming, rowing, fishing and a barbeque by the lake, or just the breathtaking Alpine views, then this place must be on top of your Switzerland Bucketlist. Moreover,"
                " The mountains and valleys around here are an open invitation to serious hikers!"),

          ],
        ),
      ),
    );
  }
}
