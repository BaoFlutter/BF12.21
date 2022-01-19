import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/models/video_model.dart';
import 'package:api_base/providers/video_list_provider.dart';
import 'package:api_base/resources/strings.dart';
import 'package:api_base/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'video_detail_screen.dart';
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
    final videoList = Provider.of<List<VideoModel>>(context);
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: videoList.length!= 0 ?
        GridView.builder(
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
        ) :
            Container(
              child: Center(
                child: Text("Loading ..."),
              )
            )


      ),
    );
  }

  // get Video List
  loadVideos(){
    futureVideoList = ApiServices().fetchVideoList();
  }


}
