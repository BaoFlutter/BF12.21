import 'package:api_base/models/video_model.dart';
import 'package:get/get.dart';

class VideoListObsController extends GetxController{
  // Rx + Tên kiểu dữ liệu : RxString, RxInt , RxDouble , RxList<VideoModel>

  // Obx = Observer + RxDart

  var videoListObs = [].obs ;  //RxList<VideoModel>
  updateVideoObs({required List<VideoModel> videoList})
  {
    this.videoListObs = videoList.obs;
    update();
  }




}