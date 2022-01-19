import 'package:api_base/models/video_model.dart';
import 'package:flutter/material.dart';

class VideoListProvider with ChangeNotifier {

  List<VideoModel> videoList = [];

  updateVideoList({ required List<VideoModel> videoList})
  {
    this.videoList = videoList;
    //notifyListeners();
  }




}