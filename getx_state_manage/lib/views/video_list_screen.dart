import 'package:api_base/controllers/video_list_controller.dart';
import 'package:api_base/controllers/video_list_obs_controller.dart';
import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/models/video_model.dart';
import 'package:api_base/resources/strings.dart';
import 'package:api_base/views/home_screen.dart';
import 'package:api_base/views/saved_screen.dart';
import 'package:api_base/views/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  Future<List<VideoModel>>? futureVideoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.backspace_rounded),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            child: Text("Saved", style: TextStyle(color: Colors.white),),
            onPressed: (){
              Get.to(()=>SavedScreen());
              /*
              var route = MaterialPageRoute(builder: (context) => SavedScreen());
              Navigator.pushAndRemoveUntil(context, route, (route) => false);

               */
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<VideoModel>>(
          future: futureVideoList,
          builder: (context, snapshot)
          {
            if(snapshot.hasError){
              return Center(
                child: Text(ERROR_LOAD_VIDEO),
              );
            }
            if(!snapshot.hasData) return Center(
              child: CircularProgressIndicator(),
            );
            List<VideoModel> videoList = snapshot.data!;
            Get.put(VideoListController()).updateVideo(videoList: videoList);
            Get.put(VideoListObsController()).updateVideoObs(videoList: videoList);
            return  GridView.builder(
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
        ),

      ),
    );
  }

  // get Video List
  loadVideos(){
    futureVideoList = ApiServices().fetchVideoList();
  }


}
