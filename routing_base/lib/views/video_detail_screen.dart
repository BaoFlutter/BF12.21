import 'package:api_base/models/video_model.dart';
import 'package:flutter/material.dart';
class VideoDetailScreen extends StatelessWidget {
  final VideoModel videoModel;
  const VideoDetailScreen({Key? key, required this.videoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết video"),
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
        child: Card(
            color: Colors.amber,
            child: Column(
              children: [
                Image.network(videoModel.url_photo!),
                Text(videoModel.title!)
              ],
            )
        ),
      )
    );
  }
}
