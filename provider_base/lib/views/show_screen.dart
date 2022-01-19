import 'package:api_base/providers/video_list_provider.dart';
import 'package:api_base/views/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class ShowScreen extends StatelessWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Show Screen"),
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
          child: Consumer<VideoListProvider>(
            builder: (context, videoListProvider, child){
              final videoList = videoListProvider.videoList ;
              return GridView.builder(
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
              );
            },
            child: Container(),
          )
      ),
    );
  }
}
