import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/models/video_model.dart';
import 'package:api_base/resources/strings.dart';
import 'package:api_base/view_models/video_list_provider.dart';
import 'package:api_base/views/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    Provider.of<VideoListProvider>(context, listen: false).getVideoList();
  }

  @override
  Widget build(BuildContext context) {
    final videoList = Provider.of<VideoListProvider>(context).videoList;
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: videoList.length!=0 ? GridView.builder(
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
        ): Center(
          child: CircularProgressIndicator(),
        )
      ),
    );
  }




}
