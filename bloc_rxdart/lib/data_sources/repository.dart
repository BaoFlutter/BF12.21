import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/models/video_model.dart';

class Repository {
  final ApiServices _apiServices = ApiServices();
  // Get Video List
  Future<List<VideoModel>>  fetchAllVideos() => _apiServices.fetchVideoList();
 // Get User Information



}