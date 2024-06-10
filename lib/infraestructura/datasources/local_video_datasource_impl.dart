import 'package:reelstok/domain/datasources/video_posts_datasource.dart';
import 'package:reelstok/domain/entities/videos_post.dart';
import 'package:reelstok/infraestructura/models/local_video_model.dart';
import 'package:reelstok/shared/data/local_video_posts.dart';

class LocalVideoDatasourceImpl implements VideoPostsDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {

    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    
    await Future.delayed(const Duration(seconds:10));
    final List<VideoPost> newVideos = videoPosts.map(
      (video) => VideoModel.fromJson(video).toVideoPostEntity()).toList();
    return newVideos;
  }

}
