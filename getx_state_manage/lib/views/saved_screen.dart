
import 'package:api_base/controllers/video_list_controller.dart';
import 'package:api_base/views/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VideoListController videoListController = Get.find();
   final videoList = videoListController.videoList;
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
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: videoList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Card(
                      color: Colors.amber,
                      child: Column(
                        children: [
                          Image.network(videoList[index].url_photo!),
                          Text(videoList[index].title!)
                        ],
                      )
                  ),
                  onTap: (){
                    var route = MaterialPageRoute(builder: (context) => VideoDetailScreen(videoModel: videoList[index]));
                    Navigator.push(context, route);
                  },
                );
              }
          )
      ),
    );
  }
}
