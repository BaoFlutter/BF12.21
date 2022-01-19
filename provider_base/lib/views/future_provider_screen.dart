import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'video_detail_screen.dart';
class FutureProviderScreen  extends StatelessWidget {
  const FutureProviderScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoList = Provider.of<List<VideoModel>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureProvider"),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: videoList.length != 0  ?
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
          ) : Container(
            child: Center(
              child: Text("Loading..."),
            ),
          )
      ),
    );
  }
}
