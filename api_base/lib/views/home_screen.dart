import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/models/video_model.dart';
import 'package:api_base/resources/strings.dart';
import 'package:api_base/views/video_detail_screen.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
