import 'package:api_base/data_sources/repository.dart';
import 'package:api_base/models/video_model.dart';
import 'package:rxdart/rxdart.dart';

class VideoListBloc {
  final _repository = Repository();

  final videoListSubject = PublishSubject<List<VideoModel>>();

  // put Data into BloC
  putVideoListIntoBloc() async {
    List<VideoModel> videoList = await _repository.fetchAllVideos();
    videoListSubject.sink.add(videoList);
  }
  // Return stream for View
  Stream<List<VideoModel>> get videoListStream => videoListSubject.stream;

  // dispose Stream / Subject
  dispose(){
    videoListSubject.close();
  }

}